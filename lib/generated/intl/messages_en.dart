// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(host) => "Add User to ${host}";

  static String m1(user) => "Users: ${user}";

  static String m2(item) => "Are you sure you want to delete ${item}?";

  static String m3(item) => "Deleted ${item}";

  static String m4(error) => "Error loading libraries: ${error}";

  static String m5(second) => "${second} seconds";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountAddNewServer": MessageLookupByLibrary.simpleMessage(
          "Add New Server",
        ),
        "accountAddUser": MessageLookupByLibrary.simpleMessage("Add User"),
        "accountAddUserDialog": m0,
        "accountAddUserSuccessDialog": MessageLookupByLibrary.simpleMessage(
          "User added successfully! Switch?",
        ),
        "accountAddUserTooltip": MessageLookupByLibrary.simpleMessage(
          "Add new server",
        ),
        "accountAnonymous": MessageLookupByLibrary.simpleMessage("Anonymous"),
        "accountDeleteServer": MessageLookupByLibrary.simpleMessage(
          "Delete Server",
        ),
        "accountInvalidURL":
            MessageLookupByLibrary.simpleMessage("Invalid URL"),
        "accountManage":
            MessageLookupByLibrary.simpleMessage("Manage Accounts"),
        "accountRegisteredServers": MessageLookupByLibrary.simpleMessage(
          "Registered Servers",
        ),
        "accountRemoveServerAndUsers": MessageLookupByLibrary.simpleMessage(
          "Remove Server and Users",
        ),
        "accountRemoveServerAndUsersHead": MessageLookupByLibrary.simpleMessage(
          "This will remove the server ",
        ),
        "accountRemoveServerAndUsersTail": MessageLookupByLibrary.simpleMessage(
          " and all its users\' login info from this app.",
        ),
        "accountRemoveUserLogin": MessageLookupByLibrary.simpleMessage(
          "Remove User Login",
        ),
        "accountRemoveUserLoginHead": MessageLookupByLibrary.simpleMessage(
          "This will remove login details of the user ",
        ),
        "accountRemoveUserLoginTail": MessageLookupByLibrary.simpleMessage(
          " from this app.",
        ),
        "accountServerURI": MessageLookupByLibrary.simpleMessage("Server URI"),
        "accountSwitch": MessageLookupByLibrary.simpleMessage("Switch Account"),
        "accountUsersCount": m1,
        "appSettings": MessageLookupByLibrary.simpleMessage("App Settings"),
        "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
        "autoSleepTimerSettings": MessageLookupByLibrary.simpleMessage(
          "Auto Sleep Timer Settings",
        ),
        "autoTurnOnSleepTimer": MessageLookupByLibrary.simpleMessage(
          "Auto Turn On Sleep Timer",
        ),
        "autoTurnOnTimer": MessageLookupByLibrary.simpleMessage(
          "Auto Turn On Timer",
        ),
        "autoTurnOnTimerAlways": MessageLookupByLibrary.simpleMessage(
          "Always Auto Turn On Timer",
        ),
        "autoTurnOnTimerAlwaysDescription":
            MessageLookupByLibrary.simpleMessage(
          "Always turn on the sleep timer, no matter what",
        ),
        "autoTurnOnTimerDescription": MessageLookupByLibrary.simpleMessage(
          "Automatically turn on the sleep timer based on the time of day",
        ),
        "autoTurnOnTimerFrom": MessageLookupByLibrary.simpleMessage("From"),
        "autoTurnOnTimerFromDescription": MessageLookupByLibrary.simpleMessage(
          "Turn on the sleep timer at the specified time",
        ),
        "autoTurnOnTimerUntil": MessageLookupByLibrary.simpleMessage("Until"),
        "autoTurnOnTimerUntilDescription": MessageLookupByLibrary.simpleMessage(
          "Turn off the sleep timer at the specified time",
        ),
        "automaticallyDescription": MessageLookupByLibrary.simpleMessage(
          "Automatically turn on the sleep timer based on the time of day",
        ),
        "backup": MessageLookupByLibrary.simpleMessage("Backup"),
        "backupAndRestore": MessageLookupByLibrary.simpleMessage(
          "Backup and Restore",
        ),
        "bookAbout": MessageLookupByLibrary.simpleMessage("About the Book"),
        "bookAboutDefault": MessageLookupByLibrary.simpleMessage(
          "Sorry, no description found",
        ),
        "bookAuthors": MessageLookupByLibrary.simpleMessage("Authors"),
        "bookDownloads": MessageLookupByLibrary.simpleMessage("Downloads"),
        "bookGenres": MessageLookupByLibrary.simpleMessage("Genres"),
        "bookMetadataAbridged":
            MessageLookupByLibrary.simpleMessage("Abridged"),
        "bookMetadataLength": MessageLookupByLibrary.simpleMessage("Length"),
        "bookMetadataPublished":
            MessageLookupByLibrary.simpleMessage("Published"),
        "bookMetadataUnabridged": MessageLookupByLibrary.simpleMessage(
          "Unabridged",
        ),
        "bookSeries": MessageLookupByLibrary.simpleMessage("Series"),
        "bookShelveEmpty": MessageLookupByLibrary.simpleMessage("Try again"),
        "bookShelveEmptyText": MessageLookupByLibrary.simpleMessage(
          "No shelves to display",
        ),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "copyToClipboard": MessageLookupByLibrary.simpleMessage(
          "Copy to Clipboard",
        ),
        "copyToClipboardDescription": MessageLookupByLibrary.simpleMessage(
          "Copy the app settings to the clipboard",
        ),
        "copyToClipboardToast": MessageLookupByLibrary.simpleMessage(
          "Settings copied to clipboard",
        ),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteDialog": m2,
        "deleted": m3,
        "explore": MessageLookupByLibrary.simpleMessage("explore"),
        "exploreHint": MessageLookupByLibrary.simpleMessage(
          "Seek and you shall discover...",
        ),
        "exploreTooltip": MessageLookupByLibrary.simpleMessage(
          "Search and Explore",
        ),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "help": MessageLookupByLibrary.simpleMessage("Help"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homeBookContinueListening": MessageLookupByLibrary.simpleMessage(
          "Continue Listening",
        ),
        "homeBookContinueListeningDescription":
            MessageLookupByLibrary.simpleMessage(
          "Show play button for books in currently listening shelf",
        ),
        "homeBookContinueSeries": MessageLookupByLibrary.simpleMessage(
          "Continue Series",
        ),
        "homeBookContinueSeriesDescription":
            MessageLookupByLibrary.simpleMessage(
          "Show play button for books in continue series shelf",
        ),
        "homeBookDiscover": MessageLookupByLibrary.simpleMessage("Discover"),
        "homeBookListenAgain":
            MessageLookupByLibrary.simpleMessage("Listen Again"),
        "homeBookListenAgainDescription": MessageLookupByLibrary.simpleMessage(
          "Show play button for all books in listen again shelf",
        ),
        "homeBookNewestAuthors": MessageLookupByLibrary.simpleMessage(
          "Newest Authors",
        ),
        "homeBookRecentlyAdded": MessageLookupByLibrary.simpleMessage(
          "Recently Added",
        ),
        "homeBookRecommended":
            MessageLookupByLibrary.simpleMessage("Recommended"),
        "homeContinueListening": MessageLookupByLibrary.simpleMessage(
          "Continue Listening",
        ),
        "homeListenAgain": MessageLookupByLibrary.simpleMessage("Listen Again"),
        "homePageSettings": MessageLookupByLibrary.simpleMessage(
          "Home Page Settings",
        ),
        "homePageSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "Customize the home page",
        ),
        "homePageSettingsOtherShelves": MessageLookupByLibrary.simpleMessage(
          "Other shelves",
        ),
        "homePageSettingsOtherShelvesDescription":
            MessageLookupByLibrary.simpleMessage(
          "Show play button for all books in all remaining shelves",
        ),
        "homePageSettingsQuickPlay": MessageLookupByLibrary.simpleMessage(
          "Quick Play",
        ),
        "homeStartListening": MessageLookupByLibrary.simpleMessage(
          "Start Listening",
        ),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "languageDescription": MessageLookupByLibrary.simpleMessage(
          "Language switch",
        ),
        "library": MessageLookupByLibrary.simpleMessage("Library"),
        "libraryChange": MessageLookupByLibrary.simpleMessage("Change Library"),
        "libraryEmpty": MessageLookupByLibrary.simpleMessage(
          "No libraries available.",
        ),
        "libraryLoadError": m4,
        "librarySelect": MessageLookupByLibrary.simpleMessage("Select Library"),
        "librarySwitchTooltip": MessageLookupByLibrary.simpleMessage(
          "Switch Library",
        ),
        "libraryTooltip": MessageLookupByLibrary.simpleMessage(
          "Browse your library",
        ),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "logs": MessageLookupByLibrary.simpleMessage("Logs"),
        "nmpSettingsBackward": MessageLookupByLibrary.simpleMessage(
          "Backward Interval",
        ),
        "nmpSettingsForward": MessageLookupByLibrary.simpleMessage(
          "Forward Interval",
        ),
        "nmpSettingsMediaControls": MessageLookupByLibrary.simpleMessage(
          "Media Controls",
        ),
        "nmpSettingsMediaControlsDescription":
            MessageLookupByLibrary.simpleMessage(
          "Select the media controls to display",
        ),
        "nmpSettingsSelectOne": MessageLookupByLibrary.simpleMessage(
          "Select a field below to insert it",
        ),
        "nmpSettingsShowChapterProgress": MessageLookupByLibrary.simpleMessage(
          "Show Chapter Progress",
        ),
        "nmpSettingsShowChapterProgressDescription":
            MessageLookupByLibrary.simpleMessage(
          "Instead of the overall progress of the book",
        ),
        "nmpSettingsSubTitle": MessageLookupByLibrary.simpleMessage(
          "Secondary Title",
        ),
        "nmpSettingsSubTitleDescription": MessageLookupByLibrary.simpleMessage(
          "The subtitle of the notification\n",
        ),
        "nmpSettingsTitle":
            MessageLookupByLibrary.simpleMessage("Primary Title"),
        "nmpSettingsTitleDescription": MessageLookupByLibrary.simpleMessage(
          "The title of the notification\n",
        ),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "notImplemented":
            MessageLookupByLibrary.simpleMessage("Not implemented"),
        "notificationMediaPlayer": MessageLookupByLibrary.simpleMessage(
          "Notification Media Player",
        ),
        "notificationMediaPlayerDescription":
            MessageLookupByLibrary.simpleMessage(
          "Customize the media player in notifications",
        ),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "pause": MessageLookupByLibrary.simpleMessage("Pause"),
        "play": MessageLookupByLibrary.simpleMessage("Play"),
        "playerSettings":
            MessageLookupByLibrary.simpleMessage("Player Settings"),
        "playerSettingsCompleteTime": MessageLookupByLibrary.simpleMessage(
          "Mark Complete When Time Left",
        ),
        "playerSettingsCompleteTimeDescriptionHead":
            MessageLookupByLibrary.simpleMessage(
                "Mark complete when less than "),
        "playerSettingsCompleteTimeDescriptionTail":
            MessageLookupByLibrary.simpleMessage(" left in the book"),
        "playerSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "Customize the player settings",
        ),
        "playerSettingsDisplay": MessageLookupByLibrary.simpleMessage(
          "Display Settings",
        ),
        "playerSettingsDisplayChapterProgress":
            MessageLookupByLibrary.simpleMessage("Show Chapter Progress"),
        "playerSettingsDisplayChapterProgressDescription":
            MessageLookupByLibrary.simpleMessage(
          "Show the progress of the current chapter in the player",
        ),
        "playerSettingsDisplayTotalProgress":
            MessageLookupByLibrary.simpleMessage(
          "Show Total Progress",
        ),
        "playerSettingsDisplayTotalProgressDescription":
            MessageLookupByLibrary.simpleMessage(
          "Show the total progress of the book in the player",
        ),
        "playerSettingsPlaybackInterval": MessageLookupByLibrary.simpleMessage(
          "Playback Report Interval",
        ),
        "playerSettingsPlaybackIntervalDescriptionHead":
            MessageLookupByLibrary.simpleMessage("Report progress every "),
        "playerSettingsPlaybackIntervalDescriptionTail":
            MessageLookupByLibrary.simpleMessage(" to the server"),
        "playerSettingsPlaybackReporting": MessageLookupByLibrary.simpleMessage(
          "Playback Reporting",
        ),
        "playerSettingsPlaybackReportingIgnore":
            MessageLookupByLibrary.simpleMessage(
          "Ignore Playback Position Less Than",
        ),
        "playerSettingsPlaybackReportingMinimum":
            MessageLookupByLibrary.simpleMessage("Minimum Position to Report"),
        "playerSettingsPlaybackReportingMinimumDescriptionHead":
            MessageLookupByLibrary.simpleMessage(
          "Do not report playback for the first ",
        ),
        "playerSettingsPlaybackReportingMinimumDescriptionTail":
            MessageLookupByLibrary.simpleMessage("of the book"),
        "playerSettingsRememberForEveryBook":
            MessageLookupByLibrary.simpleMessage(
          "Remember Player Settings for Every Book",
        ),
        "playerSettingsRememberForEveryBookDescription":
            MessageLookupByLibrary.simpleMessage(
          "Settings like speed, loudness, etc. will be remembered for every book",
        ),
        "playerSettingsSpeed": MessageLookupByLibrary.simpleMessage("Speed"),
        "playerSettingsSpeedDefault": MessageLookupByLibrary.simpleMessage(
          "Default Speed",
        ),
        "playerSettingsSpeedOptions": MessageLookupByLibrary.simpleMessage(
          "Speed Options",
        ),
        "playerSettingsSpeedOptionsSelect":
            MessageLookupByLibrary.simpleMessage(
          "Select Speed Options",
        ),
        "playerSettingsSpeedOptionsSelectAdd":
            MessageLookupByLibrary.simpleMessage(
          "Add Speed Option",
        ),
        "playerSettingsSpeedOptionsSelectAddHelper":
            MessageLookupByLibrary.simpleMessage(
                "Enter a new speed option to add"),
        "playerSettingsSpeedSelect": MessageLookupByLibrary.simpleMessage(
          "Select Speed",
        ),
        "playerSettingsSpeedSelectHelper": MessageLookupByLibrary.simpleMessage(
          "Enter the speed you want to set when playing for the first time",
        ),
        "playlistsMine": MessageLookupByLibrary.simpleMessage("My Playlists"),
        "readLess": MessageLookupByLibrary.simpleMessage("Read Less"),
        "readMore": MessageLookupByLibrary.simpleMessage("Read More"),
        "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "resetAppSettings": MessageLookupByLibrary.simpleMessage(
          "Reset App Settings",
        ),
        "resetAppSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "Reset the app settings to the default values",
        ),
        "resetAppSettingsDialog": MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to reset the app settings?",
        ),
        "restore": MessageLookupByLibrary.simpleMessage("Restore"),
        "restoreBackup": MessageLookupByLibrary.simpleMessage("Restore Backup"),
        "restoreBackupHint": MessageLookupByLibrary.simpleMessage(
          "Paste the backup here",
        ),
        "restoreBackupInvalid": MessageLookupByLibrary.simpleMessage(
          "Invalid backup",
        ),
        "restoreBackupSuccess": MessageLookupByLibrary.simpleMessage(
          "Settings restored",
        ),
        "restoreBackupValidator": MessageLookupByLibrary.simpleMessage(
          "Please paste the backup here",
        ),
        "restoreDescription": MessageLookupByLibrary.simpleMessage(
          "Restore the app settings from the backup",
        ),
        "resume": MessageLookupByLibrary.simpleMessage("Resume"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "shakeAction": MessageLookupByLibrary.simpleMessage("Shake Action"),
        "shakeActionDescription": MessageLookupByLibrary.simpleMessage(
          "The action to perform when a shake is detected",
        ),
        "shakeActivationThreshold": MessageLookupByLibrary.simpleMessage(
          "Shake Activation Threshold",
        ),
        "shakeActivationThresholdDescription":
            MessageLookupByLibrary.simpleMessage(
          "The higher the threshold, the harder you need to shake",
        ),
        "shakeDetector": MessageLookupByLibrary.simpleMessage("Shake Detector"),
        "shakeDetectorDescription": MessageLookupByLibrary.simpleMessage(
          "Customize the shake detector settings",
        ),
        "shakeDetectorEnable": MessageLookupByLibrary.simpleMessage(
          "Enable Shake Detection",
        ),
        "shakeDetectorEnableDescription": MessageLookupByLibrary.simpleMessage(
          "Enable shake detection to do various actions",
        ),
        "shakeDetectorSettings": MessageLookupByLibrary.simpleMessage(
          "Shake Detector Settings",
        ),
        "shakeFeedback": MessageLookupByLibrary.simpleMessage("Shake Feedback"),
        "shakeFeedbackDescription": MessageLookupByLibrary.simpleMessage(
          "The feedback to give when a shake is detected",
        ),
        "shakeSelectAction": MessageLookupByLibrary.simpleMessage(
          "Select Shake Action",
        ),
        "shakeSelectActivationThreshold": MessageLookupByLibrary.simpleMessage(
          "Select Shake Activation Threshold",
        ),
        "shakeSelectActivationThresholdHelper":
            MessageLookupByLibrary.simpleMessage(
          "Enter a number to set the threshold in m/s²",
        ),
        "shakeSelectFeedback": MessageLookupByLibrary.simpleMessage(
          "Select Shake Feedback",
        ),
        "themeMode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
        "themeModeDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "themeModeHighContrast": MessageLookupByLibrary.simpleMessage(
          "High Contrast Mode",
        ),
        "themeModeHighContrastDescription":
            MessageLookupByLibrary.simpleMessage(
          "Increase the contrast between the background and the text",
        ),
        "themeModeLight": MessageLookupByLibrary.simpleMessage("Light"),
        "themeModeSystem": MessageLookupByLibrary.simpleMessage("System"),
        "themeSettings": MessageLookupByLibrary.simpleMessage("Theme Settings"),
        "themeSettingsColors": MessageLookupByLibrary.simpleMessage(
          "Material Theme from System",
        ),
        "themeSettingsColorsAndroid": MessageLookupByLibrary.simpleMessage(
          "Use Material You",
        ),
        "themeSettingsColorsBook": MessageLookupByLibrary.simpleMessage(
          "Adaptive Theme on Item Page",
        ),
        "themeSettingsColorsBookDescription":
            MessageLookupByLibrary.simpleMessage(
          "Get fancy with the colors on the item page at the cost of some performance",
        ),
        "themeSettingsColorsCurrent": MessageLookupByLibrary.simpleMessage(
          "Adapt theme from currently playing item",
        ),
        "themeSettingsColorsCurrentDescription":
            MessageLookupByLibrary.simpleMessage(
          "Use the theme colors from the currently playing item for the app",
        ),
        "themeSettingsColorsDescription": MessageLookupByLibrary.simpleMessage(
          "Use the system theme colors for the app",
        ),
        "themeSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "Customize the app theme",
        ),
        "timeSecond": m5,
        "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "webVersion": MessageLookupByLibrary.simpleMessage("Web Version"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "you": MessageLookupByLibrary.simpleMessage("You"),
        "youTooltip": MessageLookupByLibrary.simpleMessage(
          "Your Profile and Settings",
        ),
      };
}
