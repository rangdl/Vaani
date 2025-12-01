import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vaani/features/per_book_settings/models/nullable_player_settings.dart';

part 'book_settings.freezed.dart';
part 'book_settings.g.dart';

/// per book settings
@freezed
class BookSettings with _$BookSettings {
  const factory BookSettings({
    required String bookId,
    @Default(NullablePlayerSettings()) NullablePlayerSettings playerSettings,
    BookProgress? progress,
  }) = _BookSettings;

  factory BookSettings.fromJson(Map<String, dynamic> json) =>
      _$BookSettingsFromJson(json);
}

@freezed
class BookProgress with _$BookProgress {
  const factory BookProgress({
    required DateTime lastUpdate,
    @Default(Duration.zero) Duration currentTime,
  }) = _BookProgress;

  factory BookProgress.fromJson(Map<String, dynamic> json) =>
      _$BookProgressFromJson(json);
}
