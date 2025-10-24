// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Are you sure you want to delete {item}?`
  String deleteDialog(String item) {
    return Intl.message(
      'Are you sure you want to delete $item?',
      name: 'deleteDialog',
      desc: '',
      args: [item],
    );
  }

  /// `Deleted {item}`
  String deleted(String item) {
    return Intl.message(
      'Deleted $item',
      name: 'deleted',
      desc: '已删除 {}',
      args: [item],
    );
  }

  /// `Pause`
  String get pause {
    return Intl.message('Pause', name: 'pause', desc: '', args: []);
  }

  /// `Play`
  String get play {
    return Intl.message('Play', name: 'play', desc: '', args: []);
  }

  /// `Resume`
  String get resume {
    return Intl.message('Resume', name: 'resume', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Read More`
  String get readMore {
    return Intl.message('Read More', name: 'readMore', desc: '', args: []);
  }

  /// `Read Less`
  String get readLess {
    return Intl.message('Read Less', name: 'readLess', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Listen Again`
  String get homeListenAgain {
    return Intl.message(
      'Listen Again',
      name: 'homeListenAgain',
      desc: '',
      args: [],
    );
  }

  /// `Continue Listening`
  String get homeContinueListening {
    return Intl.message(
      'Continue Listening',
      name: 'homeContinueListening',
      desc: '',
      args: [],
    );
  }

  /// `Start Listening`
  String get homeStartListening {
    return Intl.message(
      'Start Listening',
      name: 'homeStartListening',
      desc: '',
      args: [],
    );
  }

  /// `Continue Listening`
  String get homeBookContinueListening {
    return Intl.message(
      'Continue Listening',
      name: 'homeBookContinueListening',
      desc: '',
      args: [],
    );
  }

  /// `Continue Series`
  String get homeBookContinueSeries {
    return Intl.message(
      'Continue Series',
      name: 'homeBookContinueSeries',
      desc: '',
      args: [],
    );
  }

  /// `Recently Added`
  String get homeBookRecentlyAdded {
    return Intl.message(
      'Recently Added',
      name: 'homeBookRecentlyAdded',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get homeBookRecommended {
    return Intl.message(
      'Recommended',
      name: 'homeBookRecommended',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get homeBookDiscover {
    return Intl.message(
      'Discover',
      name: 'homeBookDiscover',
      desc: '',
      args: [],
    );
  }

  /// `Listen Again`
  String get homeBookListenAgain {
    return Intl.message(
      'Listen Again',
      name: 'homeBookListenAgain',
      desc: '',
      args: [],
    );
  }

  /// `Newest Authors`
  String get homeBookNewestAuthors {
    return Intl.message(
      'Newest Authors',
      name: 'homeBookNewestAuthors',
      desc: '',
      args: [],
    );
  }

  /// `About the Book`
  String get bookAbout {
    return Intl.message(
      'About the Book',
      name: 'bookAbout',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, no description found`
  String get bookAboutDefault {
    return Intl.message(
      'Sorry, no description found',
      name: 'bookAboutDefault',
      desc: '',
      args: [],
    );
  }

  /// `Abridged`
  String get bookMetadataAbridged {
    return Intl.message(
      'Abridged',
      name: 'bookMetadataAbridged',
      desc: '',
      args: [],
    );
  }

  /// `Unabridged`
  String get bookMetadataUnabridged {
    return Intl.message(
      'Unabridged',
      name: 'bookMetadataUnabridged',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get bookMetadataLength {
    return Intl.message(
      'Length',
      name: 'bookMetadataLength',
      desc: '',
      args: [],
    );
  }

  /// `Published`
  String get bookMetadataPublished {
    return Intl.message(
      'Published',
      name: 'bookMetadataPublished',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get bookShelveEmpty {
    return Intl.message(
      'Try again',
      name: 'bookShelveEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No shelves to display`
  String get bookShelveEmptyText {
    return Intl.message(
      'No shelves to display',
      name: 'bookShelveEmptyText',
      desc: '',
      args: [],
    );
  }

  /// `Authors`
  String get bookAuthors {
    return Intl.message('Authors', name: 'bookAuthors', desc: '', args: []);
  }

  /// `Genres`
  String get bookGenres {
    return Intl.message('Genres', name: 'bookGenres', desc: '', args: []);
  }

  /// `Series`
  String get bookSeries {
    return Intl.message('Series', name: 'bookSeries', desc: '', args: []);
  }

  /// `Downloads`
  String get bookDownloads {
    return Intl.message('Downloads', name: 'bookDownloads', desc: '', args: []);
  }

  /// `Library`
  String get library {
    return Intl.message('Library', name: 'library', desc: '', args: []);
  }

  /// `Browse your library`
  String get libraryTooltip {
    return Intl.message(
      'Browse your library',
      name: 'libraryTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Switch Library`
  String get librarySwitchTooltip {
    return Intl.message(
      'Switch Library',
      name: 'librarySwitchTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Change Library`
  String get libraryChange {
    return Intl.message(
      'Change Library',
      name: 'libraryChange',
      desc: '',
      args: [],
    );
  }

  /// `Select Library`
  String get librarySelect {
    return Intl.message(
      'Select Library',
      name: 'librarySelect',
      desc: '',
      args: [],
    );
  }

  /// `No libraries available.`
  String get libraryEmpty {
    return Intl.message(
      'No libraries available.',
      name: 'libraryEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Error loading libraries: {error}`
  String libraryLoadError(String error) {
    return Intl.message(
      'Error loading libraries: $error',
      name: 'libraryLoadError',
      desc: '',
      args: [error],
    );
  }

  /// `explore`
  String get explore {
    return Intl.message('explore', name: 'explore', desc: '', args: []);
  }

  /// `Search and Explore`
  String get exploreTooltip {
    return Intl.message(
      'Search and Explore',
      name: 'exploreTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Seek and you shall discover...`
  String get exploreHint {
    return Intl.message(
      'Seek and you shall discover...',
      name: 'exploreHint',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message('You', name: 'you', desc: '', args: []);
  }

  /// `Your Profile and Settings`
  String get youTooltip {
    return Intl.message(
      'Your Profile and Settings',
      name: 'youTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Switch Account`
  String get accountSwitch {
    return Intl.message(
      'Switch Account',
      name: 'accountSwitch',
      desc: '',
      args: [],
    );
  }

  /// `My Playlists`
  String get playlistsMine {
    return Intl.message(
      'My Playlists',
      name: 'playlistsMine',
      desc: '',
      args: [],
    );
  }

  /// `Web Version`
  String get webVersion {
    return Intl.message('Web Version', name: 'webVersion', desc: '', args: []);
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Language switch`
  String get languageDescription {
    return Intl.message(
      'Language switch',
      name: 'languageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Player Settings`
  String get playerSettings {
    return Intl.message(
      'Player Settings',
      name: 'playerSettings',
      desc: '',
      args: [],
    );
  }

  /// `Customize the player settings`
  String get playerSettingsDescription {
    return Intl.message(
      'Customize the player settings',
      name: 'playerSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Remember Player Settings for Every Book`
  String get playerSettingsRememberForEveryBook {
    return Intl.message(
      'Remember Player Settings for Every Book',
      name: 'playerSettingsRememberForEveryBook',
      desc: '',
      args: [],
    );
  }

  /// `Settings like speed, loudness, etc. will be remembered for every book`
  String get playerSettingsRememberForEveryBookDescription {
    return Intl.message(
      'Settings like speed, loudness, etc. will be remembered for every book',
      name: 'playerSettingsRememberForEveryBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `Default Speed`
  String get playerSettingsSpeedDefault {
    return Intl.message(
      'Default Speed',
      name: 'playerSettingsSpeedDefault',
      desc: '',
      args: [],
    );
  }

  /// `Speed Options`
  String get playerSettingsSpeedOptions {
    return Intl.message(
      'Speed Options',
      name: 'playerSettingsSpeedOptions',
      desc: '',
      args: [],
    );
  }

  /// `Playback Reporting`
  String get playerSettingsPlaybackReporting {
    return Intl.message(
      'Playback Reporting',
      name: 'playerSettingsPlaybackReporting',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Position to Report`
  String get playerSettingsPlaybackReportingMinimum {
    return Intl.message(
      'Minimum Position to Report',
      name: 'playerSettingsPlaybackReportingMinimum',
      desc: '',
      args: [],
    );
  }

  /// `Do not report playback for the first `
  String get playerSettingsPlaybackReportingMinimumDescriptionHead {
    return Intl.message(
      'Do not report playback for the first ',
      name: 'playerSettingsPlaybackReportingMinimumDescriptionHead',
      desc: '',
      args: [],
    );
  }

  /// `of the book`
  String get playerSettingsPlaybackReportingMinimumDescriptionTail {
    return Intl.message(
      'of the book',
      name: 'playerSettingsPlaybackReportingMinimumDescriptionTail',
      desc: '',
      args: [],
    );
  }

  /// `Ignore Playback Position Less Than`
  String get playerSettingsPlaybackReportingIgnore {
    return Intl.message(
      'Ignore Playback Position Less Than',
      name: 'playerSettingsPlaybackReportingIgnore',
      desc: '',
      args: [],
    );
  }

  /// `Auto Turn On Sleep Timer`
  String get autoTurnOnSleepTimer {
    return Intl.message(
      'Auto Turn On Sleep Timer',
      name: 'autoTurnOnSleepTimer',
      desc: '',
      args: [],
    );
  }

  /// `Automatically turn on the sleep timer based on the time of day`
  String get automaticallyDescription {
    return Intl.message(
      'Automatically turn on the sleep timer based on the time of day',
      name: 'automaticallyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Shake Detector`
  String get shakeDetector {
    return Intl.message(
      'Shake Detector',
      name: 'shakeDetector',
      desc: '',
      args: [],
    );
  }

  /// `Customize the shake detector settings`
  String get shakeDetectorDescription {
    return Intl.message(
      'Customize the shake detector settings',
      name: 'shakeDetectorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Theme Settings`
  String get themeSettings {
    return Intl.message(
      'Theme Settings',
      name: 'themeSettings',
      desc: '',
      args: [],
    );
  }

  /// `Customize the app theme`
  String get themeSettingsDescription {
    return Intl.message(
      'Customize the app theme',
      name: 'themeSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Notification Media Player`
  String get notificationMediaPlayer {
    return Intl.message(
      'Notification Media Player',
      name: 'notificationMediaPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Customize the media player in notifications`
  String get notificationMediaPlayerDescription {
    return Intl.message(
      'Customize the media player in notifications',
      name: 'notificationMediaPlayerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Home Page Settings`
  String get homePageSettings {
    return Intl.message(
      'Home Page Settings',
      name: 'homePageSettings',
      desc: '',
      args: [],
    );
  }

  /// `Customize the home page`
  String get homePageSettingsDescription {
    return Intl.message(
      'Customize the home page',
      name: 'homePageSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Backup and Restore`
  String get backupAndRestore {
    return Intl.message(
      'Backup and Restore',
      name: 'backupAndRestore',
      desc: '',
      args: [],
    );
  }

  /// `Copy to Clipboard`
  String get copyToClipboard {
    return Intl.message(
      'Copy to Clipboard',
      name: 'copyToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Copy the app settings to the clipboard`
  String get copyToClipboardDescription {
    return Intl.message(
      'Copy the app settings to the clipboard',
      name: 'copyToClipboardDescription',
      desc: '',
      args: [],
    );
  }

  /// `Settings copied to clipboard`
  String get copyToClipboardToast {
    return Intl.message(
      'Settings copied to clipboard',
      name: 'copyToClipboardToast',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get restore {
    return Intl.message('Restore', name: 'restore', desc: '', args: []);
  }

  /// `Restore the app settings from the backup`
  String get restoreDescription {
    return Intl.message(
      'Restore the app settings from the backup',
      name: 'restoreDescription',
      desc: '',
      args: [],
    );
  }

  /// `Restore Backup`
  String get restoreBackup {
    return Intl.message(
      'Restore Backup',
      name: 'restoreBackup',
      desc: '',
      args: [],
    );
  }

  /// `Backup`
  String get backup {
    return Intl.message('Backup', name: 'backup', desc: '', args: []);
  }

  /// `Paste the backup here`
  String get restoreBackupHint {
    return Intl.message(
      'Paste the backup here',
      name: 'restoreBackupHint',
      desc: '',
      args: [],
    );
  }

  /// `Please paste the backup here`
  String get restoreBackupValidator {
    return Intl.message(
      'Please paste the backup here',
      name: 'restoreBackupValidator',
      desc: '',
      args: [],
    );
  }

  /// `Invalid backup`
  String get restoreBackupInvalid {
    return Intl.message(
      'Invalid backup',
      name: 'restoreBackupInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Settings restored`
  String get restoreBackupSuccess {
    return Intl.message(
      'Settings restored',
      name: 'restoreBackupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reset App Settings`
  String get resetAppSettings {
    return Intl.message(
      'Reset App Settings',
      name: 'resetAppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Reset the app settings to the default values`
  String get resetAppSettingsDescription {
    return Intl.message(
      'Reset the app settings to the default values',
      name: 'resetAppSettingsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset the app settings?`
  String get resetAppSettingsDialog {
    return Intl.message(
      'Are you sure you want to reset the app settings?',
      name: 'resetAppSettingsDialog',
      desc: '',
      args: [],
    );
  }

  /// `Logs`
  String get logs {
    return Intl.message('Logs', name: 'logs', desc: '', args: []);
  }

  /// `Not implemented`
  String get notImplemented {
    return Intl.message(
      'Not implemented',
      name: 'notImplemented',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
