// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get clean => 'Clean';

  @override
  String get refresh => 'Refresh';

  @override
  String get reset => 'Reset';

  @override
  String get retry => 'Retry';

  @override
  String get delete => 'Delete';

  @override
  String deleteDialog(String item) {
    return 'Are you sure you want to delete $item?';
  }

  @override
  String deleted(String item) {
    return 'Deleted $item';
  }

  @override
  String get pause => 'Pause';

  @override
  String get play => 'Play';

  @override
  String get resume => 'Resume';

  @override
  String get unknown => 'Unknown';

  @override
  String get readMore => 'Read More';

  @override
  String get readLess => 'Read Less';

  @override
  String get loading => 'Loading...';

  @override
  String get help => 'Help';

  @override
  String loginTitle(String appName) {
    return 'Welcome to $appName';
  }

  @override
  String get loginServerConnected => 'Server connected, please login';

  @override
  String get loginServerNoConnected =>
      'Please enter the URL of your AudiobookShelf Server';

  @override
  String get loginServerNo => 'Do not have a server? ';

  @override
  String get loginServerClick => 'Click here';

  @override
  String get loginServerTo => ' to know how to setup a server.';

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
  String get loginUsername => 'Username';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginLogin => 'Login';

  @override
  String get home => 'Home';

  @override
  String get homeListenAgain => 'Listen Again';

  @override
  String get homeContinueListening => 'Continue Listening';

  @override
  String get homeStartListening => 'Start Listening';

  @override
  String get homeBookContinueListening => 'Continue Listening';

  @override
  String get homeBookContinueListeningDescription =>
      'Show play button for books in currently listening shelf';

  @override
  String get homeBookContinueSeries => 'Continue Series';

  @override
  String get homeBookContinueSeriesDescription =>
      'Show play button for books in continue series shelf';

  @override
  String get homeBookRecentlyAdded => 'Recently Added';

  @override
  String get homeBookRecommended => 'Recommended';

  @override
  String get homeBookDiscover => 'Discover';

  @override
  String get homeBookListenAgain => 'Listen Again';

  @override
  String get homeBookListenAgainDescription =>
      'Show play button for all books in listen again shelf';

  @override
  String get homeBookNewestAuthors => 'Newest Authors';

  @override
  String get bookAbout => 'About the Book';

  @override
  String get bookAboutDefault => 'Sorry, no description found';

  @override
  String get bookMetadataAbridged => 'Abridged';

  @override
  String get bookMetadataUnabridged => 'Unabridged';

  @override
  String get bookMetadataLength => 'Length';

  @override
  String get bookMetadataPublished => 'Published';

  @override
  String get bookShelveEmpty => 'Try again';

  @override
  String get bookShelveEmptyText => 'No shelves to display';

  @override
  String get bookAuthors => 'Authors';

  @override
  String get bookGenres => 'Genres';

  @override
  String get bookSeries => 'Series';

  @override
  String get bookDownloads => 'Downloads';

  @override
  String get chapterSelect => 'Select Chapter';

  @override
  String get chapters => 'Chapters';

  @override
  String get chapterNotFound => 'Chapters';

  @override
  String get chapterSkip => 'Skip chapter opening and ending';

  @override
  String get chapterSkipOpen => 'Skip chapter opening for ';

  @override
  String get chapterSkipEnd => 'Skip chapter opening for ';

  @override
  String get library => 'Library';

  @override
  String get libraryTooltip => 'Browse your library';

  @override
  String get librarySwitchTooltip => 'Switch Library';

  @override
  String get libraryChange => 'Change Library';

  @override
  String get librarySelect => 'Select Library';

  @override
  String get libraryEmpty => 'No libraries available.';

  @override
  String libraryLoadError(String error) {
    return 'Error loading libraries: $error';
  }

  @override
  String get explore => 'explore';

  @override
  String get exploreTooltip => 'Search and Explore';

  @override
  String get exploreHint => 'Seek and you shall discover...';

  @override
  String get you => 'You';

  @override
  String get youTooltip => 'Your Profile and Settings';

  @override
  String get settings => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get accountSwitch => 'Switch Account';

  @override
  String get accountManage => 'Manage Accounts';

  @override
  String get accountRegisteredServers => 'Registered Servers';

  @override
  String accountUsersCount(Object user) {
    return 'Users: $user';
  }

  @override
  String get accountAddNewServer => 'Add New Server';

  @override
  String get accountInvalidURL => 'Invalid URL';

  @override
  String get accountDeleteServer => 'Delete Server';

  @override
  String get accountRemoveServerAndUsers => 'Remove Server and Users';

  @override
  String get accountRemoveServerAndUsersHead => 'This will remove the server ';

  @override
  String get accountRemoveServerAndUsersTail =>
      ' and all its users\' login info from this app.';

  @override
  String get accountAddUser => 'Add User';

  @override
  String get accountAddUserTooltip => 'Add new server';

  @override
  String accountAddUserDialog(String host) {
    return 'Add User to $host';
  }

  @override
  String get accountAddUserSuccessDialog => 'User added successfully! Switch?';

  @override
  String get accountAnonymous => 'Anonymous';

  @override
  String get accountRemoveUserLogin => 'Remove User Login';

  @override
  String get accountRemoveUserLoginHead =>
      'This will remove login details of the user ';

  @override
  String get accountRemoveUserLoginTail => ' from this app.';

  @override
  String get accountServerURI => 'Server URI';

  @override
  String get playlistsMine => 'My Playlists';

  @override
  String get webVersion => 'Web Version';

  @override
  String timeSecond(int second) {
    return '$second seconds';
  }

  @override
  String get appSettings => 'App Settings';

  @override
  String get general => 'General';

  @override
  String get language => 'Language';

  @override
  String get languageDescription => 'Language switch';

  @override
  String get playerSettings => 'Player Settings';

  @override
  String get playerSettingsDescription => 'Customize the player settings';

  @override
  String get playerSettingsRememberForEveryBook =>
      'Remember Player Settings for Every Book';

  @override
  String get playerSettingsRememberForEveryBookDescription =>
      'Settings like speed, loudness, etc. will be remembered for every book';

  @override
  String get playerSettingsSpeedDefault => 'Default Speed';

  @override
  String get playerSettingsSpeedOptions => 'Speed Options';

  @override
  String get playerSettingsSpeedOptionsSelect => 'Select Speed Options';

  @override
  String get playerSettingsSpeedOptionsSelectAdd => 'Add Speed Option';

  @override
  String get playerSettingsSpeedOptionsSelectAddHelper =>
      'Enter a new speed option to add';

  @override
  String get playerSettingsSpeed => 'Speed';

  @override
  String get playerSettingsSpeedSelect => 'Select Speed';

  @override
  String get playerSettingsSpeedSelectHelper =>
      'Enter the speed you want to set when playing for the first time';

  @override
  String get playerSettingsPlaybackReporting => 'Playback Reporting';

  @override
  String get playerSettingsPlaybackReportingMinimum =>
      'Minimum Position to Report';

  @override
  String get playerSettingsPlaybackReportingMinimumDescriptionHead =>
      'Do not report playback for the first ';

  @override
  String get playerSettingsPlaybackReportingMinimumDescriptionTail =>
      'of the book';

  @override
  String get playerSettingsPlaybackReportingIgnore =>
      'Ignore Playback Position Less Than';

  @override
  String get playerSettingsCompleteTime => 'Mark Complete When Time Left';

  @override
  String get playerSettingsCompleteTimeDescriptionHead =>
      'Mark complete when less than ';

  @override
  String get playerSettingsCompleteTimeDescriptionTail => ' left in the book';

  @override
  String get playerSettingsPlaybackInterval => 'Playback Report Interval';

  @override
  String get playerSettingsPlaybackIntervalDescriptionHead =>
      'Report progress every ';

  @override
  String get playerSettingsPlaybackIntervalDescriptionTail => ' to the server';

  @override
  String get playerSettingsDisplay => 'Display Settings';

  @override
  String get playerSettingsDisplayTotalProgress => 'Show Total Progress';

  @override
  String get playerSettingsDisplayTotalProgressDescription =>
      'Show the total progress of the book in the player';

  @override
  String get playerSettingsDisplayChapterProgress => 'Show Chapter Progress';

  @override
  String get playerSettingsDisplayChapterProgressDescription =>
      'Show the progress of the current chapter in the player';

  @override
  String get sleepTimer => 'Sleep Timer';

  @override
  String get cancelSleepTimer => 'Cancel Sleep Timer';

  @override
  String get autoTurnOnSleepTimer => 'Auto Turn On Sleep Timer';

  @override
  String get automaticallyDescription =>
      'Automatically turn on the sleep timer based on the time of day';

  @override
  String get autoSleepTimerSettings => 'Auto Sleep Timer Settings';

  @override
  String get autoTurnOnTimer => 'Auto Turn On Timer';

  @override
  String get autoTurnOnTimerDescription =>
      'Automatically turn on the sleep timer based on the time of day';

  @override
  String get autoTurnOnTimerFrom => 'From';

  @override
  String get autoTurnOnTimerFromDescription =>
      'Turn on the sleep timer at the specified time';

  @override
  String get autoTurnOnTimerUntil => 'Until';

  @override
  String get autoTurnOnTimerUntilDescription =>
      'Turn off the sleep timer at the specified time';

  @override
  String get autoTurnOnTimerAlways => 'Always Auto Turn On Timer';

  @override
  String get autoTurnOnTimerAlwaysDescription =>
      'Always turn on the sleep timer, no matter what';

  @override
  String get shakeDetector => 'Shake Detector';

  @override
  String get shakeDetectorDescription =>
      'Customize the shake detector settings';

  @override
  String get shakeDetectorSettings => 'Shake Detector Settings';

  @override
  String get shakeDetectorEnable => 'Enable Shake Detection';

  @override
  String get shakeDetectorEnableDescription =>
      'Enable shake detection to do various actions';

  @override
  String get shakeActivationThreshold => 'Shake Activation Threshold';

  @override
  String get shakeActivationThresholdDescription =>
      'The higher the threshold, the harder you need to shake';

  @override
  String get shakeSelectFeedback => 'Select Shake Feedback';

  @override
  String get shakeSelectAction => 'Select Shake Action';

  @override
  String get shakeSelectActivationThreshold =>
      'Select Shake Activation Threshold';

  @override
  String get shakeSelectActivationThresholdHelper =>
      'Enter a number to set the threshold in m/s²';

  @override
  String get shakeAction => 'Shake Action';

  @override
  String get shakeActionDescription =>
      'The action to perform when a shake is detected';

  @override
  String get shakeFeedback => 'Shake Feedback';

  @override
  String get shakeFeedbackDescription =>
      'The feedback to give when a shake is detected';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeSettings => 'Theme Settings';

  @override
  String get themeSettingsDescription => 'Customize the app theme';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get themeModeHighContrast => 'High Contrast Mode';

  @override
  String get themeModeHighContrastDescription =>
      'Increase the contrast between the background and the text';

  @override
  String get themeSettingsColorsAndroid => 'Use Material You';

  @override
  String get themeSettingsColors => 'Material Theme from System';

  @override
  String get themeSettingsColorsDescription =>
      'Use the system theme colors for the app';

  @override
  String get themeSettingsColorsCurrent =>
      'Adapt theme from currently playing item';

  @override
  String get themeSettingsColorsCurrentDescription =>
      'Use the theme colors from the currently playing item for the app';

  @override
  String get themeSettingsColorsBook => 'Adaptive Theme on Item Page';

  @override
  String get themeSettingsColorsBookDescription =>
      'Get fancy with the colors on the item page at the cost of some performance';

  @override
  String get notificationMediaPlayer => 'Notification Media Player';

  @override
  String get notificationMediaPlayerDescription =>
      'Customize the media player in notifications';

  @override
  String get nmpSettingsTitle => 'Primary Title';

  @override
  String get nmpSettingsTitleDescription => 'The title of the notification\n';

  @override
  String get nmpSettingsSubTitle => 'Secondary Title';

  @override
  String get nmpSettingsSubTitleDescription =>
      'The subtitle of the notification\n';

  @override
  String get nmpSettingsForward => 'Forward Interval';

  @override
  String get nmpSettingsBackward => 'Backward Interval';

  @override
  String get nmpSettingsMediaControls => 'Media Controls';

  @override
  String get nmpSettingsMediaControlsDescription =>
      'Select the media controls to display';

  @override
  String get nmpSettingsShowChapterProgress => 'Show Chapter Progress';

  @override
  String get nmpSettingsShowChapterProgressDescription =>
      'Instead of the overall progress of the book';

  @override
  String get nmpSettingsSelectOne => 'Select a field below to insert it';

  @override
  String get homePageSettings => 'Home Page Settings';

  @override
  String get homePageSettingsDescription => 'Customize the home page';

  @override
  String get homePageSettingsQuickPlay => 'Quick Play';

  @override
  String get homePageSettingsOtherShelves => 'Other shelves';

  @override
  String get homePageSettingsOtherShelvesDescription =>
      'Show play button for all books in all remaining shelves';

  @override
  String get backupAndRestore => 'Backup and Restore';

  @override
  String get copyToClipboard => 'Copy to Clipboard';

  @override
  String get copyToClipboardDescription =>
      'Copy the app settings to the clipboard';

  @override
  String get copyToClipboardToast => 'Settings copied to clipboard';

  @override
  String get restore => 'Restore';

  @override
  String get restoreDescription => 'Restore the app settings from the backup';

  @override
  String get restoreBackup => 'Restore Backup';

  @override
  String get backup => 'Backup';

  @override
  String get restoreBackupHint => 'Paste the backup here';

  @override
  String get restoreBackupValidator => 'Please paste the backup here';

  @override
  String get restoreBackupInvalid => 'Invalid backup';

  @override
  String get restoreBackupSuccess => 'Settings restored';

  @override
  String get resetAppSettings => 'Reset App Settings';

  @override
  String get resetAppSettingsDescription =>
      'Reset the app settings to the default values';

  @override
  String get resetAppSettingsDialog =>
      'Are you sure you want to reset the app settings?';

  @override
  String get downloadSettings => 'Download Settings';

  @override
  String get downloadSettingsDescription => 'Customize download settings';

  @override
  String get erDragText => 'Pull to refresh';

  @override
  String get erDragTextUp => 'Pull to refresh';

  @override
  String get erArmedText => 'Release ready';

  @override
  String get erReadyText => 'Refreshing...';

  @override
  String get erProcessingText => 'Refreshing...';

  @override
  String get erProcessedText => 'Succeeded';

  @override
  String get erNoMoreText => 'No more';

  @override
  String get erFailedText => 'Failed';

  @override
  String get erMessageText => 'Last updated at %T';

  @override
  String get logs => 'Logs';

  @override
  String get notImplemented => 'Not implemented';

  @override
  String get ownStats => 'Own Stats';

  @override
  String get libraryStats => 'Library Stats';

  @override
  String get topAuthors => 'Top Authors';

  @override
  String get topGenres => 'Top Genres';

  @override
  String get totalAudioTracks => 'Total Audio Tracks';

  @override
  String get totalAuthors => 'Total Authors';

  @override
  String get totalDuration => 'Total Duration';

  @override
  String get totalGenres => 'Total Genres';

  @override
  String get totalItems => 'Total Items';

  @override
  String get totalSize => 'Total size';

  @override
  String get longestItems => 'Longest Items';

  @override
  String get largestItems => 'Largest Items';

  @override
  String get today => 'Today';

  @override
  String get totalTimeListened => 'Total time listened';

  @override
  String get daysListened => 'Days listened';

  @override
  String get consecutiveDays => 'Consecutive days';

  @override
  String get averagePerDay => 'Average per day';

  @override
  String get averageLastWeek => 'Average last week';

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
    return '${days}d ${hours}h ${minutes}m ${seconds}s';
  }

  @override
  String dateFormatDayHourMinuteShort(int days, int hours, int minutes) {
    return '${days}d ${hours}h ${minutes}m';
  }

  @override
  String dateFormatHourMinute(int hours, int minutes) {
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
    return '$_temp0 $_temp1';
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
    return '${hours}h ${minutes}m ${seconds}s';
  }

  @override
  String dateFormatHourMinuteShort(int hours, int minutes) {
    return '${hours}h ${minutes}m';
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
    return '${minutes}m ${seconds}s';
  }

  @override
  String dateFormatMinuteShort(int count) {
    return '${count}m';
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
    return '${count}s';
  }
}
