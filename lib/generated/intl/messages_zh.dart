// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(host) => "将用户添加到 ${host}";

  static String m1(user) => "用户数: ${user}";

  static String m2(item) => "是否要删除 ${item} ？";

  static String m3(item) => "已删除 ${item}";

  static String m4(error) => "加载库时出错：${error}";

  static String m5(error) => "Server is not reachable ${error}";

  static String m6(appName) => "欢迎使用 ${appName}";

  static String m7(second) => "${second} 秒";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("账户"),
        "accountAddNewServer": MessageLookupByLibrary.simpleMessage("添加新服务器"),
        "accountAddUser": MessageLookupByLibrary.simpleMessage("添加用户"),
        "accountAddUserDialog": m0,
        "accountAddUserSuccessDialog": MessageLookupByLibrary.simpleMessage(
          "用户添加成功！切换？",
        ),
        "accountAddUserTooltip": MessageLookupByLibrary.simpleMessage("添加新服务器"),
        "accountAnonymous": MessageLookupByLibrary.simpleMessage("匿名"),
        "accountDeleteServer": MessageLookupByLibrary.simpleMessage("删除服务器"),
        "accountInvalidURL": MessageLookupByLibrary.simpleMessage("无效网址"),
        "accountManage": MessageLookupByLibrary.simpleMessage("帐户管理"),
        "accountRegisteredServers":
            MessageLookupByLibrary.simpleMessage("已注册服务器"),
        "accountRemoveServerAndUsers": MessageLookupByLibrary.simpleMessage(
          "删除服务器和用户",
        ),
        "accountRemoveServerAndUsersHead": MessageLookupByLibrary.simpleMessage(
          "这将删除服务器 ",
        ),
        "accountRemoveServerAndUsersTail": MessageLookupByLibrary.simpleMessage(
          " 以及该应用程序中所有用户的登录信息。",
        ),
        "accountRemoveUserLogin":
            MessageLookupByLibrary.simpleMessage("删除用户登录"),
        "accountRemoveUserLoginHead": MessageLookupByLibrary.simpleMessage(
          "这将删除用户 ",
        ),
        "accountRemoveUserLoginTail": MessageLookupByLibrary.simpleMessage(
          " 的登录详细信息。",
        ),
        "accountServerURI": MessageLookupByLibrary.simpleMessage("服务器地址"),
        "accountSwitch": MessageLookupByLibrary.simpleMessage("切换账户"),
        "accountUsersCount": m1,
        "appSettings": MessageLookupByLibrary.simpleMessage("应用设置"),
        "appearance": MessageLookupByLibrary.simpleMessage("外观"),
        "autoSleepTimerSettings":
            MessageLookupByLibrary.simpleMessage("自动睡眠定时器设置"),
        "autoTurnOnSleepTimer":
            MessageLookupByLibrary.simpleMessage("自动开启睡眠定时器"),
        "autoTurnOnTimer": MessageLookupByLibrary.simpleMessage("自动开启定时器"),
        "autoTurnOnTimerAlways":
            MessageLookupByLibrary.simpleMessage("始终自动开启定时器"),
        "autoTurnOnTimerAlwaysDescription":
            MessageLookupByLibrary.simpleMessage(
          "总是打开睡眠定时器",
        ),
        "autoTurnOnTimerDescription": MessageLookupByLibrary.simpleMessage(
          "根据一天中的时间自动打开睡眠定时器",
        ),
        "autoTurnOnTimerFrom": MessageLookupByLibrary.simpleMessage("从"),
        "autoTurnOnTimerFromDescription": MessageLookupByLibrary.simpleMessage(
          "在指定时间打开睡眠定时器",
        ),
        "autoTurnOnTimerUntil": MessageLookupByLibrary.simpleMessage("直到"),
        "autoTurnOnTimerUntilDescription": MessageLookupByLibrary.simpleMessage(
          "在指定时间关闭睡眠定时器",
        ),
        "automaticallyDescription": MessageLookupByLibrary.simpleMessage(
          "根据一天中的时间自动打开睡眠定时器",
        ),
        "backup": MessageLookupByLibrary.simpleMessage("备份"),
        "backupAndRestore": MessageLookupByLibrary.simpleMessage("备份与恢复"),
        "bookAbout": MessageLookupByLibrary.simpleMessage("关于本书"),
        "bookAboutDefault": MessageLookupByLibrary.simpleMessage("抱歉，找不到描述"),
        "bookAuthors": MessageLookupByLibrary.simpleMessage("作者"),
        "bookDownloads": MessageLookupByLibrary.simpleMessage("下载"),
        "bookGenres": MessageLookupByLibrary.simpleMessage("风格"),
        "bookMetadataAbridged": MessageLookupByLibrary.simpleMessage("删节版"),
        "bookMetadataLength": MessageLookupByLibrary.simpleMessage("持续时间"),
        "bookMetadataPublished": MessageLookupByLibrary.simpleMessage("发布年份"),
        "bookMetadataUnabridged": MessageLookupByLibrary.simpleMessage("未删节版"),
        "bookSeries": MessageLookupByLibrary.simpleMessage("系列"),
        "bookShelveEmpty": MessageLookupByLibrary.simpleMessage("重试"),
        "bookShelveEmptyText": MessageLookupByLibrary.simpleMessage("未查询到书架"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "chapterNotFound": MessageLookupByLibrary.simpleMessage("未找到章节"),
        "chapterSelect": MessageLookupByLibrary.simpleMessage("选择章节"),
        "chapterSkip": MessageLookupByLibrary.simpleMessage("跳过章节片头片尾"),
        "chapterSkipEnd": MessageLookupByLibrary.simpleMessage("跳过章节片尾 "),
        "chapterSkipOpen": MessageLookupByLibrary.simpleMessage("跳过章节片头 "),
        "chapters": MessageLookupByLibrary.simpleMessage("章节列表"),
        "copyToClipboard": MessageLookupByLibrary.simpleMessage("复制到剪贴板"),
        "copyToClipboardDescription": MessageLookupByLibrary.simpleMessage(
          "将应用程序设置复制到剪贴板",
        ),
        "copyToClipboardToast":
            MessageLookupByLibrary.simpleMessage("设置已复制到剪贴板"),
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "deleteDialog": m2,
        "deleted": m3,
        "downloadSettings": MessageLookupByLibrary.simpleMessage("下载设置"),
        "downloadSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "自定义下载设置",
        ),
        "erArmedText": MessageLookupByLibrary.simpleMessage("准备就绪"),
        "erDragText": MessageLookupByLibrary.simpleMessage("下拉刷新"),
        "erDragTextUp": MessageLookupByLibrary.simpleMessage("上拉加载"),
        "erFailedText": MessageLookupByLibrary.simpleMessage("失败"),
        "erMessageText": MessageLookupByLibrary.simpleMessage("最后更新于 %T"),
        "erNoMoreText": MessageLookupByLibrary.simpleMessage("没有更多"),
        "erProcessedText": MessageLookupByLibrary.simpleMessage("成功"),
        "erProcessingText": MessageLookupByLibrary.simpleMessage("刷新..."),
        "erReadyText": MessageLookupByLibrary.simpleMessage("刷新..."),
        "explore": MessageLookupByLibrary.simpleMessage("探索"),
        "exploreHint": MessageLookupByLibrary.simpleMessage("搜索与探索..."),
        "exploreTooltip": MessageLookupByLibrary.simpleMessage("搜索和探索"),
        "general": MessageLookupByLibrary.simpleMessage("通用"),
        "help": MessageLookupByLibrary.simpleMessage("Help"),
        "home": MessageLookupByLibrary.simpleMessage("首页"),
        "homeBookContinueListening":
            MessageLookupByLibrary.simpleMessage("继续收听"),
        "homeBookContinueListeningDescription":
            MessageLookupByLibrary.simpleMessage("继续收听书架上显示播放按钮"),
        "homeBookContinueSeries": MessageLookupByLibrary.simpleMessage("继续系列"),
        "homeBookContinueSeriesDescription":
            MessageLookupByLibrary.simpleMessage(
          "继续系列书架上显示播放按钮",
        ),
        "homeBookDiscover": MessageLookupByLibrary.simpleMessage("发现"),
        "homeBookListenAgain": MessageLookupByLibrary.simpleMessage("再听一遍"),
        "homeBookListenAgainDescription": MessageLookupByLibrary.simpleMessage(
          "再听一遍书架上显示播放按钮",
        ),
        "homeBookNewestAuthors": MessageLookupByLibrary.simpleMessage("最新作者"),
        "homeBookRecentlyAdded": MessageLookupByLibrary.simpleMessage("最近添加"),
        "homeBookRecommended": MessageLookupByLibrary.simpleMessage("推荐"),
        "homeContinueListening": MessageLookupByLibrary.simpleMessage("继续收听"),
        "homeListenAgain": MessageLookupByLibrary.simpleMessage("再听一遍"),
        "homePageSettings": MessageLookupByLibrary.simpleMessage("主页设置"),
        "homePageSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "自定义主页",
        ),
        "homePageSettingsOtherShelves": MessageLookupByLibrary.simpleMessage(
          "其他书架",
        ),
        "homePageSettingsOtherShelvesDescription":
            MessageLookupByLibrary.simpleMessage("显示所有剩余书架上所有书籍的播放按钮"),
        "homePageSettingsQuickPlay":
            MessageLookupByLibrary.simpleMessage("继续播放"),
        "homeStartListening": MessageLookupByLibrary.simpleMessage("开始收听"),
        "language": MessageLookupByLibrary.simpleMessage("语言"),
        "languageDescription": MessageLookupByLibrary.simpleMessage("语言切换"),
        "library": MessageLookupByLibrary.simpleMessage("媒体库"),
        "libraryChange": MessageLookupByLibrary.simpleMessage("更改媒体库"),
        "libraryEmpty": MessageLookupByLibrary.simpleMessage("没有可用的库。"),
        "libraryLoadError": m4,
        "librarySelect": MessageLookupByLibrary.simpleMessage("选择媒体库"),
        "librarySwitchTooltip": MessageLookupByLibrary.simpleMessage("切换媒体库"),
        "libraryTooltip": MessageLookupByLibrary.simpleMessage("浏览您的媒体库"),
        "loading": MessageLookupByLibrary.simpleMessage("加载中..."),
        "loginLocal": MessageLookupByLibrary.simpleMessage("Local"),
        "loginLogin": MessageLookupByLibrary.simpleMessage("登录"),
        "loginOpenID": MessageLookupByLibrary.simpleMessage("OpenID"),
        "loginPassword": MessageLookupByLibrary.simpleMessage("密码"),
        "loginServerClick": MessageLookupByLibrary.simpleMessage("单击此处"),
        "loginServerConnected":
            MessageLookupByLibrary.simpleMessage("服务器已连接，请登录"),
        "loginServerNo": MessageLookupByLibrary.simpleMessage("没有服务器? "),
        "loginServerNoConnected": MessageLookupByLibrary.simpleMessage(
          "请输入您的AudiobookShelf服务器的URL",
        ),
        "loginServerNot": m5,
        "loginServerTo": MessageLookupByLibrary.simpleMessage(" 了解如何设置服务器。"),
        "loginTitle": m6,
        "loginToken": MessageLookupByLibrary.simpleMessage("Token"),
        "loginUsername": MessageLookupByLibrary.simpleMessage("用户名"),
        "logs": MessageLookupByLibrary.simpleMessage("日志"),
        "nmpSettingsBackward": MessageLookupByLibrary.simpleMessage("快退间隔"),
        "nmpSettingsForward": MessageLookupByLibrary.simpleMessage("快进间隔"),
        "nmpSettingsMediaControls":
            MessageLookupByLibrary.simpleMessage("媒体控制"),
        "nmpSettingsMediaControlsDescription":
            MessageLookupByLibrary.simpleMessage(
          "选择要显示的媒体控件",
        ),
        "nmpSettingsSelectOne": MessageLookupByLibrary.simpleMessage(
          "在下面选择一个字段进行插入",
        ),
        "nmpSettingsShowChapterProgress": MessageLookupByLibrary.simpleMessage(
          "显示章节进度",
        ),
        "nmpSettingsShowChapterProgressDescription":
            MessageLookupByLibrary.simpleMessage("而不是本书的整体进展"),
        "nmpSettingsSubTitle": MessageLookupByLibrary.simpleMessage("副标题"),
        "nmpSettingsSubTitleDescription": MessageLookupByLibrary.simpleMessage(
          "通知的副标题\n",
        ),
        "nmpSettingsTitle": MessageLookupByLibrary.simpleMessage("主标题"),
        "nmpSettingsTitleDescription": MessageLookupByLibrary.simpleMessage(
          "通知的标题\n",
        ),
        "no": MessageLookupByLibrary.simpleMessage("否"),
        "notImplemented": MessageLookupByLibrary.simpleMessage("未实现"),
        "notificationMediaPlayer":
            MessageLookupByLibrary.simpleMessage("通知媒体播放器"),
        "notificationMediaPlayerDescription":
            MessageLookupByLibrary.simpleMessage(
          "在通知中自定义媒体播放器",
        ),
        "ok": MessageLookupByLibrary.simpleMessage("确定"),
        "pause": MessageLookupByLibrary.simpleMessage("暂停"),
        "play": MessageLookupByLibrary.simpleMessage("播放"),
        "playerSettings": MessageLookupByLibrary.simpleMessage("播放器设置"),
        "playerSettingsCompleteTime": MessageLookupByLibrary.simpleMessage(
          "剩余时间标记完成",
        ),
        "playerSettingsCompleteTimeDescriptionHead":
            MessageLookupByLibrary.simpleMessage("当书中剩余时间少于 "),
        "playerSettingsCompleteTimeDescriptionTail":
            MessageLookupByLibrary.simpleMessage(" 时，标记完成"),
        "playerSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "自定义播放器设置",
        ),
        "playerSettingsDisplay": MessageLookupByLibrary.simpleMessage("显示设置"),
        "playerSettingsDisplayChapterProgress":
            MessageLookupByLibrary.simpleMessage("显示章节进度"),
        "playerSettingsDisplayChapterProgressDescription":
            MessageLookupByLibrary.simpleMessage("在播放器中显示当前章节的进度"),
        "playerSettingsDisplayTotalProgress":
            MessageLookupByLibrary.simpleMessage(
          "显示总进度",
        ),
        "playerSettingsDisplayTotalProgressDescription":
            MessageLookupByLibrary.simpleMessage("在播放器中显示当前书籍的总进度"),
        "playerSettingsPlaybackInterval": MessageLookupByLibrary.simpleMessage(
          "播放报告间隔",
        ),
        "playerSettingsPlaybackIntervalDescriptionHead":
            MessageLookupByLibrary.simpleMessage("每 "),
        "playerSettingsPlaybackIntervalDescriptionTail":
            MessageLookupByLibrary.simpleMessage(" 向服务器报告一次进度"),
        "playerSettingsPlaybackReporting": MessageLookupByLibrary.simpleMessage(
          "回放报告",
        ),
        "playerSettingsPlaybackReportingIgnore":
            MessageLookupByLibrary.simpleMessage("忽略播放位置小于"),
        "playerSettingsPlaybackReportingMinimum":
            MessageLookupByLibrary.simpleMessage("回放报告最小位置"),
        "playerSettingsPlaybackReportingMinimumDescriptionHead":
            MessageLookupByLibrary.simpleMessage("不要报告本书前 "),
        "playerSettingsPlaybackReportingMinimumDescriptionTail":
            MessageLookupByLibrary.simpleMessage(" 的播放"),
        "playerSettingsRememberForEveryBook":
            MessageLookupByLibrary.simpleMessage(
          "记住每本书的播放器设置",
        ),
        "playerSettingsRememberForEveryBookDescription":
            MessageLookupByLibrary.simpleMessage("每本书都会记住播放速度、音量等设置"),
        "playerSettingsSpeed": MessageLookupByLibrary.simpleMessage("播放速度"),
        "playerSettingsSpeedDefault": MessageLookupByLibrary.simpleMessage(
          "默认播放速度",
        ),
        "playerSettingsSpeedOptions": MessageLookupByLibrary.simpleMessage(
          "播放速度选项",
        ),
        "playerSettingsSpeedOptionsSelect":
            MessageLookupByLibrary.simpleMessage(
          "播放速度选项",
        ),
        "playerSettingsSpeedOptionsSelectAdd":
            MessageLookupByLibrary.simpleMessage(
          "添加一个速度选项",
        ),
        "playerSettingsSpeedOptionsSelectAddHelper":
            MessageLookupByLibrary.simpleMessage("输入一个新的速度选项"),
        "playerSettingsSpeedSelect":
            MessageLookupByLibrary.simpleMessage("选择播放速度"),
        "playerSettingsSpeedSelectHelper": MessageLookupByLibrary.simpleMessage(
          "输入默认的播放速度",
        ),
        "playlistsMine": MessageLookupByLibrary.simpleMessage("播放列表"),
        "readLess": MessageLookupByLibrary.simpleMessage("折叠"),
        "readMore": MessageLookupByLibrary.simpleMessage("展开"),
        "refresh": MessageLookupByLibrary.simpleMessage("刷新"),
        "reset": MessageLookupByLibrary.simpleMessage("重置"),
        "resetAppSettings": MessageLookupByLibrary.simpleMessage("重置应用程序设置"),
        "resetAppSettingsDescription": MessageLookupByLibrary.simpleMessage(
          "将应用程序设置重置为默认值",
        ),
        "resetAppSettingsDialog": MessageLookupByLibrary.simpleMessage(
          "您确定要重置应用程序设置吗？",
        ),
        "restore": MessageLookupByLibrary.simpleMessage("恢复"),
        "restoreBackup": MessageLookupByLibrary.simpleMessage("恢复备份"),
        "restoreBackupHint": MessageLookupByLibrary.simpleMessage("将备份粘贴到此处"),
        "restoreBackupInvalid": MessageLookupByLibrary.simpleMessage("无效备份"),
        "restoreBackupSuccess": MessageLookupByLibrary.simpleMessage("设置已恢复"),
        "restoreBackupValidator":
            MessageLookupByLibrary.simpleMessage("请将备份粘贴到此处"),
        "restoreDescription":
            MessageLookupByLibrary.simpleMessage("从备份中还原应用程序设置"),
        "resume": MessageLookupByLibrary.simpleMessage("继续"),
        "retry": MessageLookupByLibrary.simpleMessage("重试"),
        "settings": MessageLookupByLibrary.simpleMessage("设置"),
        "shakeAction": MessageLookupByLibrary.simpleMessage("抖动操作"),
        "shakeActionDescription": MessageLookupByLibrary.simpleMessage(
          "检测到抖动时要执行的操作",
        ),
        "shakeActivationThreshold":
            MessageLookupByLibrary.simpleMessage("抖动激活阈值"),
        "shakeActivationThresholdDescription":
            MessageLookupByLibrary.simpleMessage(
          "门槛越高，你就越难摇晃",
        ),
        "shakeDetector": MessageLookupByLibrary.simpleMessage("抖动检测器"),
        "shakeDetectorDescription": MessageLookupByLibrary.simpleMessage(
          "自定义抖动检测器设置",
        ),
        "shakeDetectorEnable": MessageLookupByLibrary.simpleMessage("启用抖动检测"),
        "shakeDetectorEnableDescription": MessageLookupByLibrary.simpleMessage(
          "启用抖动检测以执行各种操作",
        ),
        "shakeDetectorSettings":
            MessageLookupByLibrary.simpleMessage("抖动检测器设置"),
        "shakeFeedback": MessageLookupByLibrary.simpleMessage("抖动反馈"),
        "shakeFeedbackDescription": MessageLookupByLibrary.simpleMessage(
          "检测到抖动时给出的反馈",
        ),
        "shakeSelectAction": MessageLookupByLibrary.simpleMessage("选择抖动动作"),
        "shakeSelectActivationThreshold": MessageLookupByLibrary.simpleMessage(
          "选择抖动激活阈值",
        ),
        "shakeSelectActivationThresholdHelper":
            MessageLookupByLibrary.simpleMessage("输入一个数字以m/s²为单位设置阈值"),
        "shakeSelectFeedback": MessageLookupByLibrary.simpleMessage("选择抖动反馈"),
        "themeMode": MessageLookupByLibrary.simpleMessage("主题模式"),
        "themeModeDark": MessageLookupByLibrary.simpleMessage("深色"),
        "themeModeHighContrast": MessageLookupByLibrary.simpleMessage("高对比度模式"),
        "themeModeHighContrastDescription":
            MessageLookupByLibrary.simpleMessage(
          "增加背景和文本之间的对比度",
        ),
        "themeModeLight": MessageLookupByLibrary.simpleMessage("浅色"),
        "themeModeSystem": MessageLookupByLibrary.simpleMessage("跟随系统"),
        "themeSettings": MessageLookupByLibrary.simpleMessage("主题设置"),
        "themeSettingsColors": MessageLookupByLibrary.simpleMessage("主题色"),
        "themeSettingsColorsAndroid":
            MessageLookupByLibrary.simpleMessage("主题色"),
        "themeSettingsColorsBook": MessageLookupByLibrary.simpleMessage(
          "书籍详情页自适应主题",
        ),
        "themeSettingsColorsBookDescription":
            MessageLookupByLibrary.simpleMessage(
          "以牺牲一些性能为代价，对书籍详情页的颜色进行美化",
        ),
        "themeSettingsColorsCurrent": MessageLookupByLibrary.simpleMessage(
          "根据当前播放的书籍调整主题",
        ),
        "themeSettingsColorsCurrentDescription":
            MessageLookupByLibrary.simpleMessage("使用当前播放书籍的主题颜色"),
        "themeSettingsColorsDescription": MessageLookupByLibrary.simpleMessage(
          "使用应用程序的系统主题色",
        ),
        "themeSettingsDescription":
            MessageLookupByLibrary.simpleMessage("自定义应用主题"),
        "timeSecond": m7,
        "unknown": MessageLookupByLibrary.simpleMessage("未知"),
        "webVersion": MessageLookupByLibrary.simpleMessage("Web版本"),
        "yes": MessageLookupByLibrary.simpleMessage("是"),
        "you": MessageLookupByLibrary.simpleMessage("我的"),
        "youTooltip": MessageLookupByLibrary.simpleMessage("您的个人资料和设置"),
      };
}
