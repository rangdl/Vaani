// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get clean => '清除';

  @override
  String get refresh => '刷新';

  @override
  String get reset => '重置';

  @override
  String get retry => '重试';

  @override
  String get delete => '删除';

  @override
  String deleteDialog(String item) {
    return '是否要删除 $item ？';
  }

  @override
  String deleted(String item) {
    return '已删除 $item';
  }

  @override
  String get pause => '暂停';

  @override
  String get play => '播放';

  @override
  String get resume => '继续';

  @override
  String get unknown => '未知';

  @override
  String get readMore => '展开';

  @override
  String get readLess => '折叠';

  @override
  String get loading => '加载中...';

  @override
  String get help => 'Help';

  @override
  String loginTitle(String appName) {
    return '欢迎使用 $appName';
  }

  @override
  String get loginServerConnected => '服务器已连接，请登录';

  @override
  String get loginServerNoConnected => '请输入您的AudiobookShelf服务器的URL';

  @override
  String get loginServerNo => '没有服务器? ';

  @override
  String get loginServerClick => '单击此处';

  @override
  String get loginServerTo => ' 了解如何设置服务器。';

  @override
  String loginServerNot(String error) {
    return 'Server is not reachable $error';
  }

  @override
  String get loginLocal => 'Local';

  @override
  String get loginOpenID => 'OpenID';

  @override
  String get loginToken => 'Token';

  @override
  String get loginUsername => '用户名';

  @override
  String get loginPassword => '密码';

  @override
  String get loginLogin => '登录';

  @override
  String get home => '首页';

  @override
  String get homeListenAgain => '再听一遍';

  @override
  String get homeContinueListening => '继续收听';

  @override
  String get homeStartListening => '开始收听';

  @override
  String get homeBookContinueListening => '继续收听';

  @override
  String get homeBookContinueListeningDescription => '继续收听书架上显示播放按钮';

  @override
  String get homeBookContinueSeries => '继续系列';

  @override
  String get homeBookContinueSeriesDescription => '继续系列书架上显示播放按钮';

  @override
  String get homeBookRecentlyAdded => '最近添加';

  @override
  String get homeBookRecommended => '推荐';

  @override
  String get homeBookDiscover => '发现';

  @override
  String get homeBookListenAgain => '再听一遍';

  @override
  String get homeBookListenAgainDescription => '再听一遍书架上显示播放按钮';

  @override
  String get homeBookNewestAuthors => '最新作者';

  @override
  String get bookAbout => '关于本书';

  @override
  String get bookAboutDefault => '抱歉，找不到描述';

  @override
  String get bookMetadataAbridged => '删节版';

  @override
  String get bookMetadataUnabridged => '未删节版';

  @override
  String get bookMetadataLength => '持续时间';

  @override
  String get bookMetadataPublished => '发布年份';

  @override
  String get bookShelveEmpty => '重试';

  @override
  String get bookShelveEmptyText => '未查询到书架';

  @override
  String get bookAuthors => '作者';

  @override
  String get bookGenres => '风格';

  @override
  String get bookSeries => '系列';

  @override
  String get bookDownloads => '下载';

  @override
  String get chapterSelect => '选择章节';

  @override
  String get chapters => '章节列表';

  @override
  String get chapterNotFound => '未找到章节';

  @override
  String get chapterSkip => '跳过章节片头片尾';

  @override
  String get chapterSkipOpen => '跳过章节片头 ';

  @override
  String get chapterSkipEnd => '跳过章节片尾 ';

  @override
  String get library => '媒体库';

  @override
  String get libraryTooltip => '浏览您的媒体库';

  @override
  String get librarySwitchTooltip => '切换媒体库';

  @override
  String get libraryChange => '更改媒体库';

  @override
  String get librarySelect => '选择媒体库';

  @override
  String get libraryEmpty => '没有可用的库。';

  @override
  String libraryLoadError(String error) {
    return '加载库时出错：$error';
  }

  @override
  String get explore => '探索';

  @override
  String get exploreTooltip => '搜索和探索';

  @override
  String get exploreHint => '搜索与探索...';

  @override
  String get you => '我的';

  @override
  String get youTooltip => '您的个人资料和设置';

  @override
  String get settings => '设置';

  @override
  String get account => '账户';

  @override
  String get accountSwitch => '切换账户';

  @override
  String get accountManage => '帐户管理';

  @override
  String get accountRegisteredServers => '已注册服务器';

  @override
  String accountUsersCount(Object user) {
    return '用户数: $user';
  }

  @override
  String get accountAddNewServer => '添加新服务器';

  @override
  String get accountInvalidURL => '无效网址';

  @override
  String get accountDeleteServer => '删除服务器';

  @override
  String get accountRemoveServerAndUsers => '删除服务器和用户';

  @override
  String get accountRemoveServerAndUsersHead => '这将删除服务器 ';

  @override
  String get accountRemoveServerAndUsersTail => ' 以及该应用程序中所有用户的登录信息。';

  @override
  String get accountAddUser => '添加用户';

  @override
  String get accountAddUserTooltip => '添加新服务器';

  @override
  String accountAddUserDialog(String host) {
    return '将用户添加到 $host';
  }

  @override
  String get accountAddUserSuccessDialog => '用户添加成功！切换？';

  @override
  String get accountAnonymous => '匿名';

  @override
  String get accountRemoveUserLogin => '删除用户登录';

  @override
  String get accountRemoveUserLoginHead => '这将删除用户 ';

  @override
  String get accountRemoveUserLoginTail => ' 的登录详细信息。';

  @override
  String get accountServerURI => '服务器地址';

  @override
  String get playlistsMine => '播放列表';

  @override
  String get webVersion => 'Web版本';

  @override
  String timeSecond(int second) {
    return '$second 秒';
  }

  @override
  String get appSettings => '应用设置';

  @override
  String get general => '通用';

  @override
  String get language => '语言';

  @override
  String get languageDescription => '语言切换';

  @override
  String get playerSettings => '播放器设置';

  @override
  String get playerSettingsDescription => '自定义播放器设置';

  @override
  String get playerSettingsRememberForEveryBook => '记住每本书的播放器设置';

  @override
  String get playerSettingsRememberForEveryBookDescription =>
      '每本书都会记住播放速度、音量等设置';

  @override
  String get playerSettingsSpeedDefault => '默认播放速度';

  @override
  String get playerSettingsSpeedOptions => '播放速度选项';

  @override
  String get playerSettingsSpeedOptionsSelect => '播放速度选项';

  @override
  String get playerSettingsSpeedOptionsSelectAdd => '添加一个速度选项';

  @override
  String get playerSettingsSpeedOptionsSelectAddHelper => '输入一个新的速度选项';

  @override
  String get playerSettingsSpeed => '播放速度';

  @override
  String get playerSettingsSpeedSelect => '选择播放速度';

  @override
  String get playerSettingsSpeedSelectHelper => '输入默认的播放速度';

  @override
  String get playerSettingsPlaybackReporting => '回放报告';

  @override
  String get playerSettingsPlaybackReportingMinimum => '回放报告最小位置';

  @override
  String get playerSettingsPlaybackReportingMinimumDescriptionHead =>
      '不要报告本书前 ';

  @override
  String get playerSettingsPlaybackReportingMinimumDescriptionTail => ' 的播放';

  @override
  String get playerSettingsPlaybackReportingIgnore => '忽略播放位置小于';

  @override
  String get playerSettingsCompleteTime => '剩余时间标记完成';

  @override
  String get playerSettingsCompleteTimeDescriptionHead => '当书中剩余时间少于 ';

  @override
  String get playerSettingsCompleteTimeDescriptionTail => ' 时，标记完成';

  @override
  String get playerSettingsPlaybackInterval => '播放报告间隔';

  @override
  String get playerSettingsPlaybackIntervalDescriptionHead => '每 ';

  @override
  String get playerSettingsPlaybackIntervalDescriptionTail => ' 向服务器报告一次进度';

  @override
  String get playerSettingsDisplay => '显示设置';

  @override
  String get playerSettingsDisplayTotalProgress => '显示总进度';

  @override
  String get playerSettingsDisplayTotalProgressDescription => '在播放器中显示当前书籍的总进度';

  @override
  String get playerSettingsDisplayChapterProgress => '显示章节进度';

  @override
  String get playerSettingsDisplayChapterProgressDescription =>
      '在播放器中显示当前章节的进度';

  @override
  String get sleepTimer => '睡眠定时器';

  @override
  String get cancelSleepTimer => '取消睡眠定时器';

  @override
  String get autoTurnOnSleepTimer => '自动开启睡眠定时器';

  @override
  String get automaticallyDescription => '根据一天中的时间自动打开睡眠定时器';

  @override
  String get autoSleepTimerSettings => '自动睡眠定时器设置';

  @override
  String get autoTurnOnTimer => '自动开启定时器';

  @override
  String get autoTurnOnTimerDescription => '根据一天中的时间自动打开睡眠定时器';

  @override
  String get autoTurnOnTimerFrom => '从';

  @override
  String get autoTurnOnTimerFromDescription => '在指定时间打开睡眠定时器';

  @override
  String get autoTurnOnTimerUntil => '直到';

  @override
  String get autoTurnOnTimerUntilDescription => '在指定时间关闭睡眠定时器';

  @override
  String get autoTurnOnTimerAlways => '始终自动开启定时器';

  @override
  String get autoTurnOnTimerAlwaysDescription => '总是打开睡眠定时器';

  @override
  String get shakeDetector => '抖动检测器';

  @override
  String get shakeDetectorDescription => '自定义抖动检测器设置';

  @override
  String get shakeDetectorSettings => '抖动检测器设置';

  @override
  String get shakeDetectorEnable => '启用抖动检测';

  @override
  String get shakeDetectorEnableDescription => '启用抖动检测以执行各种操作';

  @override
  String get shakeActivationThreshold => '抖动激活阈值';

  @override
  String get shakeActivationThresholdDescription => '门槛越高，你就越难摇晃';

  @override
  String get shakeSelectFeedback => '选择抖动反馈';

  @override
  String get shakeSelectAction => '选择抖动动作';

  @override
  String get shakeSelectActivationThreshold => '选择抖动激活阈值';

  @override
  String get shakeSelectActivationThresholdHelper => '输入一个数字以m/s²为单位设置阈值';

  @override
  String get shakeAction => '抖动操作';

  @override
  String get shakeActionDescription => '检测到抖动时要执行的操作';

  @override
  String get shakeFeedback => '抖动反馈';

  @override
  String get shakeFeedbackDescription => '检测到抖动时给出的反馈';

  @override
  String get appearance => '外观';

  @override
  String get themeSettings => '主题设置';

  @override
  String get themeSettingsDescription => '自定义应用主题';

  @override
  String get themeMode => '主题模式';

  @override
  String get themeModeLight => '浅色';

  @override
  String get themeModeSystem => '跟随系统';

  @override
  String get themeModeDark => '深色';

  @override
  String get themeModeHighContrast => '高对比度模式';

  @override
  String get themeModeHighContrastDescription => '增加背景和文本之间的对比度';

  @override
  String get themeSettingsColorsAndroid => '主题色';

  @override
  String get themeSettingsColors => '主题色';

  @override
  String get themeSettingsColorsDescription => '使用应用程序的系统主题色';

  @override
  String get themeSettingsColorsCurrent => '根据当前播放的书籍调整主题';

  @override
  String get themeSettingsColorsCurrentDescription => '使用当前播放书籍的主题颜色';

  @override
  String get themeSettingsColorsBook => '书籍详情页自适应主题';

  @override
  String get themeSettingsColorsBookDescription => '以牺牲一些性能为代价，对书籍详情页的颜色进行美化';

  @override
  String get notificationMediaPlayer => '通知媒体播放器';

  @override
  String get notificationMediaPlayerDescription => '在通知中自定义媒体播放器';

  @override
  String get nmpSettingsTitle => '主标题';

  @override
  String get nmpSettingsTitleDescription => '通知的标题\n';

  @override
  String get nmpSettingsSubTitle => '副标题';

  @override
  String get nmpSettingsSubTitleDescription => '通知的副标题\n';

  @override
  String get nmpSettingsForward => '快进间隔';

  @override
  String get nmpSettingsBackward => '快退间隔';

  @override
  String get nmpSettingsMediaControls => '媒体控制';

  @override
  String get nmpSettingsMediaControlsDescription => '选择要显示的媒体控件';

  @override
  String get nmpSettingsShowChapterProgress => '显示章节进度';

  @override
  String get nmpSettingsShowChapterProgressDescription => '而不是本书的整体进展';

  @override
  String get nmpSettingsSelectOne => '在下面选择一个字段进行插入';

  @override
  String get homePageSettings => '主页设置';

  @override
  String get homePageSettingsDescription => '自定义主页';

  @override
  String get homePageSettingsQuickPlay => '继续播放';

  @override
  String get homePageSettingsOtherShelves => '其他书架';

  @override
  String get homePageSettingsOtherShelvesDescription => '显示所有剩余书架上所有书籍的播放按钮';

  @override
  String get backupAndRestore => '备份与恢复';

  @override
  String get copyToClipboard => '复制到剪贴板';

  @override
  String get copyToClipboardDescription => '将应用程序设置复制到剪贴板';

  @override
  String get copyToClipboardToast => '设置已复制到剪贴板';

  @override
  String get restore => '恢复';

  @override
  String get restoreDescription => '从备份中还原应用程序设置';

  @override
  String get restoreBackup => '恢复备份';

  @override
  String get backup => '备份';

  @override
  String get restoreBackupHint => '将备份粘贴到此处';

  @override
  String get restoreBackupValidator => '请将备份粘贴到此处';

  @override
  String get restoreBackupInvalid => '无效备份';

  @override
  String get restoreBackupSuccess => '设置已恢复';

  @override
  String get resetAppSettings => '重置应用程序设置';

  @override
  String get resetAppSettingsDescription => '将应用程序设置重置为默认值';

  @override
  String get resetAppSettingsDialog => '您确定要重置应用程序设置吗？';

  @override
  String get downloadSettings => '下载设置';

  @override
  String get downloadSettingsDescription => '自定义下载设置';

  @override
  String get erDragText => '下拉刷新';

  @override
  String get erDragTextUp => '上拉加载';

  @override
  String get erArmedText => '准备就绪';

  @override
  String get erReadyText => '刷新...';

  @override
  String get erProcessingText => '刷新...';

  @override
  String get erProcessedText => '成功';

  @override
  String get erNoMoreText => '没有更多';

  @override
  String get erFailedText => '失败';

  @override
  String get erMessageText => '最后更新于 %T';

  @override
  String get logs => '日志';

  @override
  String get notImplemented => '未实现';

  @override
  String get ownStats => '我的统计';

  @override
  String get libraryStats => '媒体库统计';

  @override
  String get topAuthors => '顶级作者';

  @override
  String get topGenres => '顶级类型';

  @override
  String get totalAudioTracks => '总音轨数';

  @override
  String get totalAuthors => '作者总数';

  @override
  String get totalDuration => '总时长';

  @override
  String get totalGenres => '风格总数';

  @override
  String get totalItems => '项目总数';

  @override
  String get totalSize => '总大小';

  @override
  String get longestItems => '最长项目';

  @override
  String get largestItems => '最大项目';

  @override
  String get today => '今日收听时长';

  @override
  String get totalTimeListened => '总收听时长';

  @override
  String get daysListened => '收听天数';

  @override
  String get consecutiveDays => '连续收听天数';

  @override
  String get averagePerDay => '平均每天';

  @override
  String get averageLastWeek => '上周平均';

  @override
  String dateFormatDayHourMinute(int days, int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    String _temp1 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours',
      one: '$hours hour',
    );
    String _temp2 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '$minutes minute',
    );
    return '$_temp0 $_temp1 $_temp2';
  }

  @override
  String dateFormatDayHourMinuteSecond(
    int days,
    int hours,
    int minutes,
    int seconds,
  ) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '$days day',
    );
    String _temp1 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours',
      one: '$hours hour',
    );
    String _temp2 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '$minutes minute',
    );
    String _temp3 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds seconds',
      one: '$seconds second',
    );
    return '$_temp0 $_temp1 $_temp2 $_temp3';
  }

  @override
  String dateFormatDayHourMinuteSecondShort(
    int days,
    int hours,
    int minutes,
    int seconds,
  ) {
    return '$days天 $hours时 $minutes分 $seconds秒';
  }

  @override
  String dateFormatDayHourMinuteShort(int days, int hours, int minutes) {
    return '$days天 $hours时 $minutes分';
  }

  @override
  String dateFormatHourMinute(int hours, int minutes) {
    return '$hours时 $minutes分';
  }

  @override
  String dateFormatHourMinuteSecond(int hours, int minutes, int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours',
      one: '$hours hour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '$minutes minute',
    );
    String _temp2 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds seconds',
      one: '$seconds second',
    );
    return '$_temp0 $_temp1 $_temp2';
  }

  @override
  String dateFormatHourMinuteSecondShort(int hours, int minutes, int seconds) {
    return '$hours时 $minutes分 $seconds秒';
  }

  @override
  String dateFormatHourMinuteShort(int hours, int minutes) {
    return '$hours时 $minutes分';
  }

  @override
  String dateFormatMinute(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '$count minute',
    );
    return '$_temp0';
  }

  @override
  String dateFormatMinuteSecond(int minutes, int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '$minutes minute',
    );
    String _temp1 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds seconds',
      one: '$seconds second',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String dateFormatMinuteSecondShort(int minutes, int seconds) {
    return '$minutes分 $seconds秒';
  }

  @override
  String dateFormatMinuteShort(int count) {
    return '$count分';
  }

  @override
  String dateFormatSecond(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '$count  second',
    );
    return '$_temp0';
  }

  @override
  String dateFormatSecondShort(int count) {
    return '$count秒';
  }
}
