import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:vaani/features/downloads/providers/download_manager.dart';
import 'package:vaani/features/player/core/audiobook_player_session.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/features/player/providers/session_provider.dart';
import 'package:vaani/features/shake_detection/providers/shake_detector.dart';
import 'package:vaani/features/skip_start_end/skip_start_end_provider.dart';
import 'package:vaani/features/sleep_timer/providers/sleep_timer_provider.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/shared/utils/utils.dart';
import 'package:window_manager/window_manager.dart';

class Framework extends ConsumerStatefulWidget {
  final Widget child;
  final AbsAudioHandler? audioHandler;
  const Framework({required this.child, this.audioHandler, super.key});

  @override
  ConsumerState<Framework> createState() => _FrameworkState();
}

class _FrameworkState extends ConsumerState<Framework>
    with TrayListener, WindowListener {
  @override
  void initState() {
    if (Utils.isDesktop()) {
      windowManager.addListener(this);
      _init();
    }
    super.initState();
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    await trayManager.setIcon(
      Utils.isWindows() ? 'assets/icon/logo.ico' : 'assets/icon/logo.png',
    );
    await trayManager.setToolTip(appName);
    Menu menu = Menu(
      items: [
        MenuItem(
          key: 'show_window',
          // label: 'Show Window',
          label: '显示主窗口',
          onClick: (menuItem) => windowManager.show(),
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'play_pause',
          label: '播放/暂停',
          onClick: (menuItem) =>
              ref.read(audiobookPlayerProvider).togglePlayPause(),
        ),
        MenuItem(
          key: 'previous',
          label: '上一个',
          onClick: (menuItem) =>
              ref.read(audiobookPlayerProvider).seekToPrevious(),
        ),
        MenuItem(
          key: 'next',
          label: '下一个',
          onClick: (menuItem) => ref.read(audiobookPlayerProvider).seekToNext(),
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'exit_app',
          // label: 'Exit App',
          label: '退出',
          onClick: (menuItem) => windowManager.destroy(),
        ),
      ],
    );
    await trayManager.setContextMenu(menu);
    trayManager.addListener(this);
  }

  @override
  Widget build(BuildContext context) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    try {
      ref.watch(simpleDownloadManagerProvider);
      if (Utils.isAndroid()) ref.watch(shakeDetectorProvider);
      ref.watch(sleepTimerProvider);
      ref.watch(skipStartEndProvider);
      ref.watch(playbackReporterProvider);
    } catch (e) {
      debugPrintStack(stackTrace: StackTrace.current, label: e.toString());
      appLogger.severe(e.toString());
    }
    return widget.child;
  }

  @override
  void onTrayIconMouseDown() {
    // do something, for example pop up the menu
    // print('onTrayIconMouseDown');
    windowManager.show();
  }

  @override
  void onTrayIconMouseUp() {
    // do something, for example pop up the menu
    // print('onTrayIconMouseUp');
  }

  @override
  void onTrayIconRightMouseDown() {
    // do something
    // print('onTrayIconRightMouseDown');
    trayManager.popUpContextMenu(bringAppToFront: true);
  }

  @override
  void onTrayIconRightMouseUp() {
    // do something
    // print('onTrayIconRightMouseUp');
  }

  // @override
  // void onTrayMenuItemClick(MenuItem menuItem) {
  //   print(menuItem.key);
  //   if (menuItem.key == 'show_window') {
  //     // do something
  //   } else if (menuItem.key == 'exit_app') {
  //     // do something

  //   } else if (menuItem.key == 'play_pause'){

  //   }
  // }

  @override
  void onWindowClose() async {
    final isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      windowManager.hide();
    }
  }
}
