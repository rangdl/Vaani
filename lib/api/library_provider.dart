// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show Ref, ProviderListenableSelect;
import 'package:logging/logging.dart' show Logger;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelfsdk/audiobookshelf_api.dart'
    show GetLibrarysItemsReqParams, Library, LibraryItem, Filter, SeriesFilter;
import 'package:vaani/api/api_provider.dart' show authenticatedApiProvider;
import 'package:vaani/features/settings/api_settings_provider.dart'
    show apiSettingsProvider;

part 'library_provider.g.dart';

final _logger = Logger('LibraryProvider');

@riverpod
Future<Library?> library(Ref ref, String id) async {
  final api = ref.watch(authenticatedApiProvider);
  final library = await api.libraries.get(libraryId: id);
  if (library == null) {
    _logger.warning('No library found through id: $id');
    //  try to get the library from the list of libraries
    final libraries = await ref.watch(librariesProvider.future);
    for (final lib in libraries) {
      if (lib.id == id) {
        return lib;
      }
    }
    _logger.warning('No library found in the list of libraries');
    return null;
  }
  _logger.fine('Fetched library: $library');
  return library.library;
}

@riverpod
Future<Library?> currentLibrary(Ref ref) async {
  final libraryId = ref.watch(
    apiSettingsProvider.select((s) => s.activeLibraryId),
  );
  if (libraryId == null) {
    _logger.warning('No active library id found');
    return null;
  }
  return await ref.watch(libraryProvider(libraryId).future);
}

@riverpod
class Libraries extends _$Libraries {
  @override
  FutureOr<List<Library>> build() async {
    final api = ref.watch(authenticatedApiProvider);
    final libraries = await api.libraries.getAll();
    if (libraries == null) {
      _logger.warning('Failed to fetch libraries');
      return [];
    }
    _logger.fine('Fetched ${libraries.length} libraries');
    ref.keepAlive();
    return libraries;
  }
}

class LibraryItemsState {
  final List<LibraryItem> items;
  final int limit;
  final int page;
  final String sort;
  final bool desc;
  final bool isLoading;
  final bool isRefreshing;
  final bool hasMore;
  final bool hasError;
  final String? errorMessage;

  // 折叠系列
  final bool collapseSeries;
  final Filter? filter;

  const LibraryItemsState({
    this.items = const [],
    this.limit = 18,
    this.page = 0,
    this.sort = 'media.metadata.title',
    this.desc = false,
    this.isLoading = false,
    this.isRefreshing = false,
    this.hasMore = false,
    this.hasError = false,
    this.errorMessage,
    this.collapseSeries = true,
    this.filter,
  });

  LibraryItemsState copyWith({
    List<LibraryItem>? items,
    int? limit,
    int? page,
    String? sort,
    bool? desc,
    bool? isLoading,
    bool? isRefreshing,
    bool? hasMore,
    bool? hasError,
    String? errorMessage,
    bool? collapseSeries,
    Filter? filter,
  }) {
    return LibraryItemsState(
      items: items ?? this.items,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      sort: sort ?? this.sort,
      desc: desc ?? this.desc,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      hasMore: hasMore ?? this.hasMore,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      collapseSeries: collapseSeries ?? this.collapseSeries,
      filter: filter ?? this.filter,
    );
  }

  final sortMap = const {
    'media.metadata.title': '标题',
    'media.metadata.authorName': '作者(姓,名)',
    'media.metadata.authorNameLF': '作者(名,姓)',
    'media.metadata.publishedYear': '发布年份',
    'addedAt': '添加于',
    'size': '文件大小',
    'media.duration': '持续时间',
    'birthtimeMs': '文件创建时间',
    'mtimeMs': '文件修改时间',
    'progress': '进度更新时间',
    'progress.createdAt': '开始日期',
    'progress.finishedAt': '完成日期',
    'random': '随机',
  };
  List<String> get sortList => sortMap.keys.toList();
  String sortDisplay(String sort) {
    return sortMap[sort] ?? 'unknown';
  }

  final moreMap = const {'collapseSeries': '折叠系列'};
  List<String> get moreList => moreMap.keys.toList();
  String moreDisplay(String sort) {
    return moreMap[sort] ?? 'unknown';
  }
}

// 查询库下所有项目
@riverpod
class LibraryItems extends _$LibraryItems {
  @override
  LibraryItemsState build({String? seriesId}) {
    // 初始加载数据
    Future.microtask(_loadInitialData);
    return LibraryItemsState(
      filter: seriesId != null ? SeriesFilter(seriesId) : null,
    );
  }

  // 下拉刷新
  Future<void> refresh() async {
    if (state.isRefreshing) return;

    // 开始刷新
    state = state.copyWith(
      page: 0,
      isRefreshing: true,
      hasError: false,
      errorMessage: null,
    );
    try {
      final items = await _load();
      state = state.copyWith(
        items: [...items],
        page: state.page + 1,
        isRefreshing: false,
        hasMore: items.length == state.limit,
      );
    } catch (e) {
      state = state.copyWith(
        isRefreshing: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }

  // 初始加载数据
  Future<void> _loadInitialData() async {
    // await _loadMore(skip: true);
    await _loadMore();
  }

  // 上拉加载更多
  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    await _loadMore();
  }

  // 内部加载方法
  Future<void> _loadMore({bool skip = false}) async {
    if (!skip) {
      state = state.copyWith(
        isLoading: true,
        hasError: false,
        errorMessage: null,
      );
    }
    try {
      final items = await _load();
      state = state.copyWith(
        items: [...state.items, ...items],
        page: state.page + 1,
        isLoading: false,
        hasMore: items.length == state.limit,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }

  // 加载方法
  Future<List<LibraryItem>> _load() async {
    final api = ref.read(authenticatedApiProvider);
    final libraryId = ref.watch(
      apiSettingsProvider.select((s) => s.activeLibraryId),
    );
    if (libraryId != null) {
      final newItems = await api.libraries.getItems(
        libraryId: libraryId,
        parameters: GetLibrarysItemsReqParams(
          limit: state.limit,
          page: state.page,
          sort: state.sort,
          desc: state.desc,
          minified: true,
          collapseSeries: state.collapseSeries,
          filter: state.filter,
        ),
      );
      return newItems?.results ?? [];
    }
    return [];
  }

  void update(LibraryItemsState record) {
    state = record;
    refresh();
  }
}
