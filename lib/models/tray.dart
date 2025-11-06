import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:vaani/features/player/providers/audiobook_player.dart';
import 'package:vaani/settings/constants.dart';
import 'package:vaani/shared/utils/utils.dart';
import 'package:window_manager/window_manager.dart';

class TrayFramework extends ConsumerStatefulWidget {
  final Widget child;
  const TrayFramework(this.child, {super.key});

  @override
  ConsumerState<TrayFramework> createState() => _TrayFrameworkState();
}

class _TrayFrameworkState extends ConsumerState<TrayFramework>
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
    await trayManager.setToolTip(AppMetadata.appName);
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
