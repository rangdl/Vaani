import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @clean.
  ///
  /// In en, this message translates to:
  /// **'Clean'**
  String get clean;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteDialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {item}?'**
  String deleteDialog(String item);

  /// 已删除 {}
  ///
  /// In en, this message translates to:
  /// **'Deleted {item}'**
  String deleted(String item);

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// No description provided for @readLess.
  ///
  /// In en, this message translates to:
  /// **'Read Less'**
  String get readLess;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {appName}'**
  String loginTitle(String appName);

  /// No description provided for @loginServerConnected.
  ///
  /// In en, this message translates to:
  /// **'Server connected, please login'**
  String get loginServerConnected;

  /// No description provided for @loginServerNoConnected.
  ///
  /// In en, this message translates to:
  /// **'Please enter the URL of your AudiobookShelf Server'**
  String get loginServerNoConnected;

  /// No description provided for @loginServerNo.
  ///
  /// In en, this message translates to:
  /// **'Do not have a server? '**
  String get loginServerNo;

  /// No description provided for @loginServerClick.
  ///
  /// In en, this message translates to:
  /// **'Click here'**
  String get loginServerClick;

  /// No description provided for @loginServerTo.
  ///
  /// In en, this message translates to:
  /// **' to know how to setup a server.'**
  String get loginServerTo;

  /// No description provided for @loginServerNot.
  ///
  /// In en, this message translates to:
  /// **'Server is not reachable {error}'**
  String loginServerNot(String error);

  /// No description provided for @loginLocal.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get loginLocal;

  /// No description provided for @loginOpenID.
  ///
  /// In en, this message translates to:
  /// **'OpenID'**
  String get loginOpenID;

  /// No description provided for @loginToken.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get loginToken;

  /// No description provided for @loginUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get loginUsername;

  /// No description provided for @loginPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPassword;

  /// No description provided for @loginLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginLogin;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @homeListenAgain.
  ///
  /// In en, this message translates to:
  /// **'Listen Again'**
  String get homeListenAgain;

  /// No description provided for @homeContinueListening.
  ///
  /// In en, this message translates to:
  /// **'Continue Listening'**
  String get homeContinueListening;

  /// No description provided for @homeStartListening.
  ///
  /// In en, this message translates to:
  /// **'Start Listening'**
  String get homeStartListening;

  /// No description provided for @homeBookContinueListening.
  ///
  /// In en, this message translates to:
  /// **'Continue Listening'**
  String get homeBookContinueListening;

  /// No description provided for @homeBookContinueListeningDescription.
  ///
  /// In en, this message translates to:
  /// **'Show play button for books in currently listening shelf'**
  String get homeBookContinueListeningDescription;

  /// No description provided for @homeBookContinueSeries.
  ///
  /// In en, this message translates to:
  /// **'Continue Series'**
  String get homeBookContinueSeries;

  /// No description provided for @homeBookContinueSeriesDescription.
  ///
  /// In en, this message translates to:
  /// **'Show play button for books in continue series shelf'**
  String get homeBookContinueSeriesDescription;

  /// No description provided for @homeBookRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently Added'**
  String get homeBookRecentlyAdded;

  /// No description provided for @homeBookRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get homeBookRecommended;

  /// No description provided for @homeBookDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get homeBookDiscover;

  /// No description provided for @homeBookListenAgain.
  ///
  /// In en, this message translates to:
  /// **'Listen Again'**
  String get homeBookListenAgain;

  /// No description provided for @homeBookListenAgainDescription.
  ///
  /// In en, this message translates to:
  /// **'Show play button for all books in listen again shelf'**
  String get homeBookListenAgainDescription;

  /// No description provided for @homeBookNewestAuthors.
  ///
  /// In en, this message translates to:
  /// **'Newest Authors'**
  String get homeBookNewestAuthors;

  /// No description provided for @bookAbout.
  ///
  /// In en, this message translates to:
  /// **'About the Book'**
  String get bookAbout;

  /// No description provided for @bookAboutDefault.
  ///
  /// In en, this message translates to:
  /// **'Sorry, no description found'**
  String get bookAboutDefault;

  /// No description provided for @bookMetadataAbridged.
  ///
  /// In en, this message translates to:
  /// **'Abridged'**
  String get bookMetadataAbridged;

  /// No description provided for @bookMetadataUnabridged.
  ///
  /// In en, this message translates to:
  /// **'Unabridged'**
  String get bookMetadataUnabridged;

  /// No description provided for @bookMetadataLength.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get bookMetadataLength;

  /// No description provided for @bookMetadataPublished.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get bookMetadataPublished;

  /// No description provided for @bookShelveEmpty.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get bookShelveEmpty;

  /// No description provided for @bookShelveEmptyText.
  ///
  /// In en, this message translates to:
  /// **'No shelves to display'**
  String get bookShelveEmptyText;

  /// No description provided for @bookAuthors.
  ///
  /// In en, this message translates to:
  /// **'Authors'**
  String get bookAuthors;

  /// No description provided for @bookGenres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get bookGenres;

  /// No description provided for @bookSeries.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get bookSeries;

  /// No description provided for @bookDownloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get bookDownloads;

  /// No description provided for @chapterSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Chapter'**
  String get chapterSelect;

  /// No description provided for @chapters.
  ///
  /// In en, this message translates to:
  /// **'Chapters'**
  String get chapters;

  /// No description provided for @chapterNotFound.
  ///
  /// In en, this message translates to:
  /// **'Chapters'**
  String get chapterNotFound;

  /// No description provided for @chapterSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip chapter opening and ending'**
  String get chapterSkip;

  /// No description provided for @chapterSkipOpen.
  ///
  /// In en, this message translates to:
  /// **'Skip chapter opening for '**
  String get chapterSkipOpen;

  /// No description provided for @chapterSkipEnd.
  ///
  /// In en, this message translates to:
  /// **'Skip chapter opening for '**
  String get chapterSkipEnd;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @libraryTooltip.
  ///
  /// In en, this message translates to:
  /// **'Browse your library'**
  String get libraryTooltip;

  /// No description provided for @librarySwitchTooltip.
  ///
  /// In en, this message translates to:
  /// **'Switch Library'**
  String get librarySwitchTooltip;

  /// No description provided for @libraryChange.
  ///
  /// In en, this message translates to:
  /// **'Change Library'**
  String get libraryChange;

  /// No description provided for @librarySelect.
  ///
  /// In en, this message translates to:
  /// **'Select Library'**
  String get librarySelect;

  /// No description provided for @libraryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No libraries available.'**
  String get libraryEmpty;

  /// No description provided for @libraryLoadError.
  ///
  /// In en, this message translates to:
  /// **'Error loading libraries: {error}'**
  String libraryLoadError(String error);

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'explore'**
  String get explore;

  /// No description provided for @exploreTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search and Explore'**
  String get exploreTooltip;

  /// No description provided for @exploreHint.
  ///
  /// In en, this message translates to:
  /// **'Seek and you shall discover...'**
  String get exploreHint;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @youTooltip.
  ///
  /// In en, this message translates to:
  /// **'Your Profile and Settings'**
  String get youTooltip;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @accountSwitch.
  ///
  /// In en, this message translates to:
  /// **'Switch Account'**
  String get accountSwitch;

  /// No description provided for @accountManage.
  ///
  /// In en, this message translates to:
  /// **'Manage Accounts'**
  String get accountManage;

  /// No description provided for @accountRegisteredServers.
  ///
  /// In en, this message translates to:
  /// **'Registered Servers'**
  String get accountRegisteredServers;

  /// No description provided for @accountUsersCount.
  ///
  /// In en, this message translates to:
  /// **'Users: {user}'**
  String accountUsersCount(Object user);

  /// No description provided for @accountAddNewServer.
  ///
  /// In en, this message translates to:
  /// **'Add New Server'**
  String get accountAddNewServer;

  /// No description provided for @accountInvalidURL.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL'**
  String get accountInvalidURL;

  /// No description provided for @accountDeleteServer.
  ///
  /// In en, this message translates to:
  /// **'Delete Server'**
  String get accountDeleteServer;

  /// No description provided for @accountRemoveServerAndUsers.
  ///
  /// In en, this message translates to:
  /// **'Remove Server and Users'**
  String get accountRemoveServerAndUsers;

  /// No description provided for @accountRemoveServerAndUsersHead.
  ///
  /// In en, this message translates to:
  /// **'This will remove the server '**
  String get accountRemoveServerAndUsersHead;

  /// No description provided for @accountRemoveServerAndUsersTail.
  ///
  /// In en, this message translates to:
  /// **' and all its users\' login info from this app.'**
  String get accountRemoveServerAndUsersTail;

  /// No description provided for @accountAddUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get accountAddUser;

  /// No description provided for @accountAddUserTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new server'**
  String get accountAddUserTooltip;

  /// No description provided for @accountAddUserDialog.
  ///
  /// In en, this message translates to:
  /// **'Add User to {host}'**
  String accountAddUserDialog(String host);

  /// No description provided for @accountAddUserSuccessDialog.
  ///
  /// In en, this message translates to:
  /// **'User added successfully! Switch?'**
  String get accountAddUserSuccessDialog;

  /// No description provided for @accountAnonymous.
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get accountAnonymous;

  /// No description provided for @accountRemoveUserLogin.
  ///
  /// In en, this message translates to:
  /// **'Remove User Login'**
  String get accountRemoveUserLogin;

  /// No description provided for @accountRemoveUserLoginHead.
  ///
  /// In en, this message translates to:
  /// **'This will remove login details of the user '**
  String get accountRemoveUserLoginHead;

  /// No description provided for @accountRemoveUserLoginTail.
  ///
  /// In en, this message translates to:
  /// **' from this app.'**
  String get accountRemoveUserLoginTail;

  /// No description provided for @accountServerURI.
  ///
  /// In en, this message translates to:
  /// **'Server URI'**
  String get accountServerURI;

  /// No description provided for @playlistsMine.
  ///
  /// In en, this message translates to:
  /// **'My Playlists'**
  String get playlistsMine;

  /// No description provided for @webVersion.
  ///
  /// In en, this message translates to:
  /// **'Web Version'**
  String get webVersion;

  /// No description provided for @timeSecond.
  ///
  /// In en, this message translates to:
  /// **'{second} seconds'**
  String timeSecond(int second);

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageDescription.
  ///
  /// In en, this message translates to:
  /// **'Language switch'**
  String get languageDescription;

  /// No description provided for @playerSettings.
  ///
  /// In en, this message translates to:
  /// **'Player Settings'**
  String get playerSettings;

  /// No description provided for @playerSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize the player settings'**
  String get playerSettingsDescription;

  /// No description provided for @playerSettingsRememberForEveryBook.
  ///
  /// In en, this message translates to:
  /// **'Remember Player Settings for Every Book'**
  String get playerSettingsRememberForEveryBook;

  /// No description provided for @playerSettingsRememberForEveryBookDescription.
  ///
  /// In en, this message translates to:
  /// **'Settings like speed, loudness, etc. will be remembered for every book'**
  String get playerSettingsRememberForEveryBookDescription;

  /// No description provided for @playerSettingsSpeedDefault.
  ///
  /// In en, this message translates to:
  /// **'Default Speed'**
  String get playerSettingsSpeedDefault;

  /// No description provided for @playerSettingsSpeedOptions.
  ///
  /// In en, this message translates to:
  /// **'Speed Options'**
  String get playerSettingsSpeedOptions;

  /// No description provided for @playerSettingsSpeedOptionsSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Speed Options'**
  String get playerSettingsSpeedOptionsSelect;

  /// No description provided for @playerSettingsSpeedOptionsSelectAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Speed Option'**
  String get playerSettingsSpeedOptionsSelectAdd;

  /// No description provided for @playerSettingsSpeedOptionsSelectAddHelper.
  ///
  /// In en, this message translates to:
  /// **'Enter a new speed option to add'**
  String get playerSettingsSpeedOptionsSelectAddHelper;

  /// No description provided for @playerSettingsSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get playerSettingsSpeed;

  /// No description provided for @playerSettingsSpeedSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Speed'**
  String get playerSettingsSpeedSelect;

  /// No description provided for @playerSettingsSpeedSelectHelper.
  ///
  /// In en, this message translates to:
  /// **'Enter the speed you want to set when playing for the first time'**
  String get playerSettingsSpeedSelectHelper;

  /// No description provided for @playerSettingsPlaybackReporting.
  ///
  /// In en, this message translates to:
  /// **'Playback Reporting'**
  String get playerSettingsPlaybackReporting;

  /// No description provided for @playerSettingsPlaybackReportingMinimum.
  ///
  /// In en, this message translates to:
  /// **'Minimum Position to Report'**
  String get playerSettingsPlaybackReportingMinimum;

  /// No description provided for @playerSettingsPlaybackReportingMinimumDescriptionHead.
  ///
  /// In en, this message translates to:
  /// **'Do not report playback for the first '**
  String get playerSettingsPlaybackReportingMinimumDescriptionHead;

  /// No description provided for @playerSettingsPlaybackReportingMinimumDescriptionTail.
  ///
  /// In en, this message translates to:
  /// **'of the book'**
  String get playerSettingsPlaybackReportingMinimumDescriptionTail;

  /// No description provided for @playerSettingsPlaybackReportingIgnore.
  ///
  /// In en, this message translates to:
  /// **'Ignore Playback Position Less Than'**
  String get playerSettingsPlaybackReportingIgnore;

  /// No description provided for @playerSettingsCompleteTime.
  ///
  /// In en, this message translates to:
  /// **'Mark Complete When Time Left'**
  String get playerSettingsCompleteTime;

  /// No description provided for @playerSettingsCompleteTimeDescriptionHead.
  ///
  /// In en, this message translates to:
  /// **'Mark complete when less than '**
  String get playerSettingsCompleteTimeDescriptionHead;

  /// No description provided for @playerSettingsCompleteTimeDescriptionTail.
  ///
  /// In en, this message translates to:
  /// **' left in the book'**
  String get playerSettingsCompleteTimeDescriptionTail;

  /// No description provided for @playerSettingsPlaybackInterval.
  ///
  /// In en, this message translates to:
  /// **'Playback Report Interval'**
  String get playerSettingsPlaybackInterval;

  /// No description provided for @playerSettingsPlaybackIntervalDescriptionHead.
  ///
  /// In en, this message translates to:
  /// **'Report progress every '**
  String get playerSettingsPlaybackIntervalDescriptionHead;

  /// No description provided for @playerSettingsPlaybackIntervalDescriptionTail.
  ///
  /// In en, this message translates to:
  /// **' to the server'**
  String get playerSettingsPlaybackIntervalDescriptionTail;

  /// No description provided for @playerSettingsDisplay.
  ///
  /// In en, this message translates to:
  /// **'Display Settings'**
  String get playerSettingsDisplay;

  /// No description provided for @playerSettingsDisplayTotalProgress.
  ///
  /// In en, this message translates to:
  /// **'Show Total Progress'**
  String get playerSettingsDisplayTotalProgress;

  /// No description provided for @playerSettingsDisplayTotalProgressDescription.
  ///
  /// In en, this message translates to:
  /// **'Show the total progress of the book in the player'**
  String get playerSettingsDisplayTotalProgressDescription;

  /// No description provided for @playerSettingsDisplayChapterProgress.
  ///
  /// In en, this message translates to:
  /// **'Show Chapter Progress'**
  String get playerSettingsDisplayChapterProgress;

  /// No description provided for @playerSettingsDisplayChapterProgressDescription.
  ///
  /// In en, this message translates to:
  /// **'Show the progress of the current chapter in the player'**
  String get playerSettingsDisplayChapterProgressDescription;

  /// No description provided for @sleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Sleep Timer'**
  String get sleepTimer;

  /// No description provided for @cancelSleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Cancel Sleep Timer'**
  String get cancelSleepTimer;

  /// No description provided for @autoTurnOnSleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Auto Turn On Sleep Timer'**
  String get autoTurnOnSleepTimer;

  /// No description provided for @automaticallyDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically turn on the sleep timer based on the time of day'**
  String get automaticallyDescription;

  /// No description provided for @autoSleepTimerSettings.
  ///
  /// In en, this message translates to:
  /// **'Auto Sleep Timer Settings'**
  String get autoSleepTimerSettings;

  /// No description provided for @autoTurnOnTimer.
  ///
  /// In en, this message translates to:
  /// **'Auto Turn On Timer'**
  String get autoTurnOnTimer;

  /// No description provided for @autoTurnOnTimerDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically turn on the sleep timer based on the time of day'**
  String get autoTurnOnTimerDescription;

  /// No description provided for @autoTurnOnTimerFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get autoTurnOnTimerFrom;

  /// No description provided for @autoTurnOnTimerFromDescription.
  ///
  /// In en, this message translates to:
  /// **'Turn on the sleep timer at the specified time'**
  String get autoTurnOnTimerFromDescription;

  /// No description provided for @autoTurnOnTimerUntil.
  ///
  /// In en, this message translates to:
  /// **'Until'**
  String get autoTurnOnTimerUntil;

  /// No description provided for @autoTurnOnTimerUntilDescription.
  ///
  /// In en, this message translates to:
  /// **'Turn off the sleep timer at the specified time'**
  String get autoTurnOnTimerUntilDescription;

  /// No description provided for @autoTurnOnTimerAlways.
  ///
  /// In en, this message translates to:
  /// **'Always Auto Turn On Timer'**
  String get autoTurnOnTimerAlways;

  /// No description provided for @autoTurnOnTimerAlwaysDescription.
  ///
  /// In en, this message translates to:
  /// **'Always turn on the sleep timer, no matter what'**
  String get autoTurnOnTimerAlwaysDescription;

  /// No description provided for @shakeDetector.
  ///
  /// In en, this message translates to:
  /// **'Shake Detector'**
  String get shakeDetector;

  /// No description provided for @shakeDetectorDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize the shake detector settings'**
  String get shakeDetectorDescription;

  /// No description provided for @shakeDetectorSettings.
  ///
  /// In en, this message translates to:
  /// **'Shake Detector Settings'**
  String get shakeDetectorSettings;

  /// No description provided for @shakeDetectorEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable Shake Detection'**
  String get shakeDetectorEnable;

  /// No description provided for @shakeDetectorEnableDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable shake detection to do various actions'**
  String get shakeDetectorEnableDescription;

  /// No description provided for @shakeActivationThreshold.
  ///
  /// In en, this message translates to:
  /// **'Shake Activation Threshold'**
  String get shakeActivationThreshold;

  /// No description provided for @shakeActivationThresholdDescription.
  ///
  /// In en, this message translates to:
  /// **'The higher the threshold, the harder you need to shake'**
  String get shakeActivationThresholdDescription;

  /// No description provided for @shakeSelectFeedback.
  ///
  /// In en, this message translates to:
  /// **'Select Shake Feedback'**
  String get shakeSelectFeedback;

  /// No description provided for @shakeSelectAction.
  ///
  /// In en, this message translates to:
  /// **'Select Shake Action'**
  String get shakeSelectAction;

  /// No description provided for @shakeSelectActivationThreshold.
  ///
  /// In en, this message translates to:
  /// **'Select Shake Activation Threshold'**
  String get shakeSelectActivationThreshold;

  /// No description provided for @shakeSelectActivationThresholdHelper.
  ///
  /// In en, this message translates to:
  /// **'Enter a number to set the threshold in m/s²'**
  String get shakeSelectActivationThresholdHelper;

  /// No description provided for @shakeAction.
  ///
  /// In en, this message translates to:
  /// **'Shake Action'**
  String get shakeAction;

  /// No description provided for @shakeActionDescription.
  ///
  /// In en, this message translates to:
  /// **'The action to perform when a shake is detected'**
  String get shakeActionDescription;

  /// No description provided for @shakeFeedback.
  ///
  /// In en, this message translates to:
  /// **'Shake Feedback'**
  String get shakeFeedback;

  /// No description provided for @shakeFeedbackDescription.
  ///
  /// In en, this message translates to:
  /// **'The feedback to give when a shake is detected'**
  String get shakeFeedbackDescription;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @themeSettings.
  ///
  /// In en, this message translates to:
  /// **'Theme Settings'**
  String get themeSettings;

  /// No description provided for @themeSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize the app theme'**
  String get themeSettingsDescription;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @themeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeModeLight;

  /// No description provided for @themeModeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeModeSystem;

  /// No description provided for @themeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeModeDark;

  /// No description provided for @themeModeHighContrast.
  ///
  /// In en, this message translates to:
  /// **'High Contrast Mode'**
  String get themeModeHighContrast;

  /// No description provided for @themeModeHighContrastDescription.
  ///
  /// In en, this message translates to:
  /// **'Increase the contrast between the background and the text'**
  String get themeModeHighContrastDescription;

  /// No description provided for @themeSettingsColorsAndroid.
  ///
  /// In en, this message translates to:
  /// **'Use Material You'**
  String get themeSettingsColorsAndroid;

  /// No description provided for @themeSettingsColors.
  ///
  /// In en, this message translates to:
  /// **'Material Theme from System'**
  String get themeSettingsColors;

  /// No description provided for @themeSettingsColorsDescription.
  ///
  /// In en, this message translates to:
  /// **'Use the system theme colors for the app'**
  String get themeSettingsColorsDescription;

  /// No description provided for @themeSettingsColorsCurrent.
  ///
  /// In en, this message translates to:
  /// **'Adapt theme from currently playing item'**
  String get themeSettingsColorsCurrent;

  /// No description provided for @themeSettingsColorsCurrentDescription.
  ///
  /// In en, this message translates to:
  /// **'Use the theme colors from the currently playing item for the app'**
  String get themeSettingsColorsCurrentDescription;

  /// No description provided for @themeSettingsColorsBook.
  ///
  /// In en, this message translates to:
  /// **'Adaptive Theme on Item Page'**
  String get themeSettingsColorsBook;

  /// No description provided for @themeSettingsColorsBookDescription.
  ///
  /// In en, this message translates to:
  /// **'Get fancy with the colors on the item page at the cost of some performance'**
  String get themeSettingsColorsBookDescription;

  /// No description provided for @notificationMediaPlayer.
  ///
  /// In en, this message translates to:
  /// **'Notification Media Player'**
  String get notificationMediaPlayer;

  /// No description provided for @notificationMediaPlayerDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize the media player in notifications'**
  String get notificationMediaPlayerDescription;

  /// No description provided for @nmpSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Primary Title'**
  String get nmpSettingsTitle;

  /// No description provided for @nmpSettingsTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'The title of the notification\n'**
  String get nmpSettingsTitleDescription;

  /// No description provided for @nmpSettingsSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Secondary Title'**
  String get nmpSettingsSubTitle;

  /// No description provided for @nmpSettingsSubTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'The subtitle of the notification\n'**
  String get nmpSettingsSubTitleDescription;

  /// No description provided for @nmpSettingsForward.
  ///
  /// In en, this message translates to:
  /// **'Forward Interval'**
  String get nmpSettingsForward;

  /// No description provided for @nmpSettingsBackward.
  ///
  /// In en, this message translates to:
  /// **'Backward Interval'**
  String get nmpSettingsBackward;

  /// No description provided for @nmpSettingsMediaControls.
  ///
  /// In en, this message translates to:
  /// **'Media Controls'**
  String get nmpSettingsMediaControls;

  /// No description provided for @nmpSettingsMediaControlsDescription.
  ///
  /// In en, this message translates to:
  /// **'Select the media controls to display'**
  String get nmpSettingsMediaControlsDescription;

  /// No description provided for @nmpSettingsShowChapterProgress.
  ///
  /// In en, this message translates to:
  /// **'Show Chapter Progress'**
  String get nmpSettingsShowChapterProgress;

  /// No description provided for @nmpSettingsShowChapterProgressDescription.
  ///
  /// In en, this message translates to:
  /// **'Instead of the overall progress of the book'**
  String get nmpSettingsShowChapterProgressDescription;

  /// No description provided for @nmpSettingsSelectOne.
  ///
  /// In en, this message translates to:
  /// **'Select a field below to insert it'**
  String get nmpSettingsSelectOne;

  /// No description provided for @homePageSettings.
  ///
  /// In en, this message translates to:
  /// **'Home Page Settings'**
  String get homePageSettings;

  /// No description provided for @homePageSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize the home page'**
  String get homePageSettingsDescription;

  /// No description provided for @homePageSettingsQuickPlay.
  ///
  /// In en, this message translates to:
  /// **'Quick Play'**
  String get homePageSettingsQuickPlay;

  /// No description provided for @homePageSettingsOtherShelves.
  ///
  /// In en, this message translates to:
  /// **'Other shelves'**
  String get homePageSettingsOtherShelves;

  /// No description provided for @homePageSettingsOtherShelvesDescription.
  ///
  /// In en, this message translates to:
  /// **'Show play button for all books in all remaining shelves'**
  String get homePageSettingsOtherShelvesDescription;

  /// No description provided for @backupAndRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup and Restore'**
  String get backupAndRestore;

  /// No description provided for @copyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to Clipboard'**
  String get copyToClipboard;

  /// No description provided for @copyToClipboardDescription.
  ///
  /// In en, this message translates to:
  /// **'Copy the app settings to the clipboard'**
  String get copyToClipboardDescription;

  /// No description provided for @copyToClipboardToast.
  ///
  /// In en, this message translates to:
  /// **'Settings copied to clipboard'**
  String get copyToClipboardToast;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @restoreDescription.
  ///
  /// In en, this message translates to:
  /// **'Restore the app settings from the backup'**
  String get restoreDescription;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore Backup'**
  String get restoreBackup;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @restoreBackupHint.
  ///
  /// In en, this message translates to:
  /// **'Paste the backup here'**
  String get restoreBackupHint;

  /// No description provided for @restoreBackupValidator.
  ///
  /// In en, this message translates to:
  /// **'Please paste the backup here'**
  String get restoreBackupValidator;

  /// No description provided for @restoreBackupInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid backup'**
  String get restoreBackupInvalid;

  /// No description provided for @restoreBackupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Settings restored'**
  String get restoreBackupSuccess;

  /// No description provided for @resetAppSettings.
  ///
  /// In en, this message translates to:
  /// **'Reset App Settings'**
  String get resetAppSettings;

  /// No description provided for @resetAppSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Reset the app settings to the default values'**
  String get resetAppSettingsDescription;

  /// No description provided for @resetAppSettingsDialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset the app settings?'**
  String get resetAppSettingsDialog;

  /// No description provided for @downloadSettings.
  ///
  /// In en, this message translates to:
  /// **'Download Settings'**
  String get downloadSettings;

  /// No description provided for @downloadSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize download settings'**
  String get downloadSettingsDescription;

  /// No description provided for @erDragText.
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh'**
  String get erDragText;

  /// No description provided for @erDragTextUp.
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh'**
  String get erDragTextUp;

  /// No description provided for @erArmedText.
  ///
  /// In en, this message translates to:
  /// **'Release ready'**
  String get erArmedText;

  /// No description provided for @erReadyText.
  ///
  /// In en, this message translates to:
  /// **'Refreshing...'**
  String get erReadyText;

  /// No description provided for @erProcessingText.
  ///
  /// In en, this message translates to:
  /// **'Refreshing...'**
  String get erProcessingText;

  /// No description provided for @erProcessedText.
  ///
  /// In en, this message translates to:
  /// **'Succeeded'**
  String get erProcessedText;

  /// No description provided for @erNoMoreText.
  ///
  /// In en, this message translates to:
  /// **'No more'**
  String get erNoMoreText;

  /// No description provided for @erFailedText.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get erFailedText;

  /// No description provided for @erMessageText.
  ///
  /// In en, this message translates to:
  /// **'Last updated at %T'**
  String get erMessageText;

  /// No description provided for @logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// No description provided for @notImplemented.
  ///
  /// In en, this message translates to:
  /// **'Not implemented'**
  String get notImplemented;

  /// No description provided for @ownStats.
  ///
  /// In en, this message translates to:
  /// **'Own Stats'**
  String get ownStats;

  /// No description provided for @libraryStats.
  ///
  /// In en, this message translates to:
  /// **'Library Stats'**
  String get libraryStats;

  /// No description provided for @topAuthors.
  ///
  /// In en, this message translates to:
  /// **'Top Authors'**
  String get topAuthors;

  /// No description provided for @topGenres.
  ///
  /// In en, this message translates to:
  /// **'Top Genres'**
  String get topGenres;

  /// No description provided for @totalAudioTracks.
  ///
  /// In en, this message translates to:
  /// **'Total Audio Tracks'**
  String get totalAudioTracks;

  /// No description provided for @totalAuthors.
  ///
  /// In en, this message translates to:
  /// **'Total Authors'**
  String get totalAuthors;

  /// No description provided for @totalDuration.
  ///
  /// In en, this message translates to:
  /// **'Total Duration'**
  String get totalDuration;

  /// No description provided for @totalGenres.
  ///
  /// In en, this message translates to:
  /// **'Total Genres'**
  String get totalGenres;

  /// No description provided for @totalItems.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get totalItems;

  /// No description provided for @totalSize.
  ///
  /// In en, this message translates to:
  /// **'Total size'**
  String get totalSize;

  /// No description provided for @longestItems.
  ///
  /// In en, this message translates to:
  /// **'Longest Items'**
  String get longestItems;

  /// No description provided for @largestItems.
  ///
  /// In en, this message translates to:
  /// **'Largest Items'**
  String get largestItems;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @totalTimeListened.
  ///
  /// In en, this message translates to:
  /// **'Total time listened'**
  String get totalTimeListened;

  /// No description provided for @daysListened.
  ///
  /// In en, this message translates to:
  /// **'Days listened'**
  String get daysListened;

  /// No description provided for @consecutiveDays.
  ///
  /// In en, this message translates to:
  /// **'Consecutive days'**
  String get consecutiveDays;

  /// No description provided for @averagePerDay.
  ///
  /// In en, this message translates to:
  /// **'Average per day'**
  String get averagePerDay;

  /// No description provided for @averageLastWeek.
  ///
  /// In en, this message translates to:
  /// **'Average last week'**
  String get averageLastWeek;

  /// No description provided for @dateFormatDayHourMinute.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, one {{days} day} other {{days} days}} {hours, plural, one {{hours} hour} other {{hours} hours}} {minutes, plural, one {{minutes} minute} other {{minutes} minutes}}'**
  String dateFormatDayHourMinute(int days, int hours, int minutes);

  /// No description provided for @dateFormatDayHourMinuteSecond.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, one {{days} day} other {{days} days}} {hours, plural, one {{hours} hour} other {{hours} hours}} {minutes, plural, one {{minutes} minute} other {{minutes} minutes}} {seconds, plural, one {{seconds} second} other {{seconds} seconds}}'**
  String dateFormatDayHourMinuteSecond(
    int days,
    int hours,
    int minutes,
    int seconds,
  );

  /// No description provided for @dateFormatDayHourMinuteSecondShort.
  ///
  /// In en, this message translates to:
  /// **'{days}d {hours}h {minutes}m {seconds}s'**
  String dateFormatDayHourMinuteSecondShort(
    int days,
    int hours,
    int minutes,
    int seconds,
  );

  /// No description provided for @dateFormatDayHourMinuteShort.
  ///
  /// In en, this message translates to:
  /// **'{days}d {hours}h {minutes}m'**
  String dateFormatDayHourMinuteShort(int days, int hours, int minutes);

  /// No description provided for @dateFormatHourMinute.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, one {{hours} hour} other {{hours} hours}} {minutes, plural, one {{minutes} minute} other {{minutes} minutes}}'**
  String dateFormatHourMinute(int hours, int minutes);

  /// No description provided for @dateFormatHourMinuteSecond.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, one {{hours} hour} other {{hours} hours}} {minutes, plural, one {{minutes} minute} other {{minutes} minutes}} {seconds, plural, one {{seconds} second} other {{seconds} seconds}}'**
  String dateFormatHourMinuteSecond(int hours, int minutes, int seconds);

  /// No description provided for @dateFormatHourMinuteSecondShort.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m {seconds}s'**
  String dateFormatHourMinuteSecondShort(int hours, int minutes, int seconds);

  /// No description provided for @dateFormatHourMinuteShort.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String dateFormatHourMinuteShort(int hours, int minutes);

  /// No description provided for @dateFormatMinute.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {{count} minute} other {{count} minutes}}'**
  String dateFormatMinute(int count);

  /// No description provided for @dateFormatMinuteSecond.
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, one {{minutes} minute} other {{minutes} minutes}} {seconds, plural, one {{seconds} second} other {{seconds} seconds}}'**
  String dateFormatMinuteSecond(int minutes, int seconds);

  /// No description provided for @dateFormatMinuteSecondShort.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m {seconds}s'**
  String dateFormatMinuteSecondShort(int minutes, int seconds);

  /// No description provided for @dateFormatMinuteShort.
  ///
  /// In en, this message translates to:
  /// **'{count}m'**
  String dateFormatMinuteShort(int count);

  /// No description provided for @dateFormatSecond.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {{count}  second} other {{count} seconds}}'**
  String dateFormatSecond(int count);

  /// No description provided for @dateFormatSecondShort.
  ///
  /// In en, this message translates to:
  /// **'{count}s'**
  String dateFormatSecondShort(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
