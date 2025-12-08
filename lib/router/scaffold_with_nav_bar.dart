import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/api/library_provider.dart' show currentLibraryProvider;
import 'package:vaani/features/explore/providers/search_controller.dart';
import 'package:vaani/features/player/providers/abs_provider.dart';
import 'package:vaani/features/player/view/player_minimized.dart';
import 'package:vaani/features/you/view/widgets/library_switch_chip.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/globals.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/icons/abs_icons.dart' show AbsIcons;

// stack to track changes in navigationShell.currentIndex
// home is always at index 0 and at the start and should be the last before popping
// if stack is empty, push home, if already contains home, pop it
final Set<int> navigationShellStack = {};

const bottomBarHeight = 64;

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends HookConsumerWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    // 竖屏
    final isVertical = size.height > size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          isVertical ? navigationShell : buildNavLeft(context, ref),
          Hero(tag: 'player_hero', child: const PlayerMinimized()),
        ],
      ),
      bottomNavigationBar: isVertical ? buildNavBottom(context, ref) : null,
    );
  }

  Widget buildNavLeft(BuildContext context, WidgetRef ref) {
    // final isPlayerActive = ref.watch(isPlayerActiveProvider);
    final currentBook = ref.watch(currentBookProvider);
    return Padding(
      padding:
          EdgeInsets.only(bottom: currentBook != null ? playerMinHeight : 0),
      child: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              minWidth: 60,
              minExtendedWidth: 180,
              extended: MediaQuery.of(context).size.width > 640,
              // extended: false,
              destinations: _navigationItems(context).map((item) {
                final isDestinationLibrary = item.name == S.of(context).library;
                var currentLibrary =
                    ref.watch(currentLibraryProvider).valueOrNull;
                final libraryIcon = AbsIcons.getIconByName(
                  currentLibrary?.icon,
                );
                final destinationWidget = NavigationRailDestination(
                  icon: Icon(
                    isDestinationLibrary ? libraryIcon ?? item.icon : item.icon,
                  ),
                  selectedIcon: Icon(
                    isDestinationLibrary
                        ? libraryIcon ?? item.activeIcon
                        : item.activeIcon,
                  ),
                  label: Text(
                    isDestinationLibrary
                        ? currentLibrary?.name ?? item.name
                        : item.name,
                  ),
                  // tooltip: item.tooltip,
                );
                // if (isDestinationLibrary) {
                //   return GestureDetector(
                //     onSecondaryTap: () => showLibrarySwitcher(context, ref),
                //     onDoubleTap: () => showLibrarySwitcher(context, ref),
                //     child:
                //         destinationWidget, // Wrap the actual NavigationDestination
                //   );
                // } else {
                //   // Return the unwrapped destination for other items
                //   return destinationWidget;
                // }
                return destinationWidget;
                // return NavigationRailDestination(icon: Icon(nav.icon), label: Text(nav.name));
              }).toList(),
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (int index) {
                _onTap(context, index, ref);
              },
            ),
          ),
          VerticalDivider(width: 0.5, thickness: 0.5),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }

  Widget? buildNavBottom(BuildContext context, WidgetRef ref) {
    // final size = MediaQuery.of(context).size;
    // final playerProgress = ref.watch(playerHeightProvider);
    // final playerMaxHeight = size.height;
    // var percentExpandedMiniPlayer = (playerProgress - playerMinHeight) /
    //     (playerMaxHeight - playerMinHeight);
    // // Clamp the value between 0 and 1
    // percentExpandedMiniPlayer = percentExpandedMiniPlayer.clamp(0.0, 1.0);
    return NavigationBar(
      elevation: 0.0,
      height: bottomBarHeight.toDouble(),

      // TODO: get destinations from the navigationShell
      // Here, the items of BottomNavigationBar are hard coded. In a real
      // world scenario, the items would most likely be generated from the
      // branches of the shell route, which can be fetched using
      // `navigationShell.route.branches`.
      destinations: _navigationItems(context).map((item) {
        final isDestinationLibrary = item.name == S.of(context).library;
        var currentLibrary = ref.watch(currentLibraryProvider).valueOrNull;
        final libraryIcon = AbsIcons.getIconByName(
          currentLibrary?.icon,
        );
        final destinationWidget = NavigationDestination(
          icon: Icon(
            isDestinationLibrary ? libraryIcon ?? item.icon : item.icon,
          ),
          selectedIcon: Icon(
            isDestinationLibrary
                ? libraryIcon ?? item.activeIcon
                : item.activeIcon,
          ),
          label: isDestinationLibrary
              ? currentLibrary?.name ?? item.name
              : item.name,
          tooltip: item.tooltip,
        );
        if (isDestinationLibrary) {
          return GestureDetector(
            onSecondaryTap: () => showLibrarySwitcher(context, ref),
            onDoubleTap: () => showLibrarySwitcher(context, ref),
            child: destinationWidget, // Wrap the actual NavigationDestination
          );
        } else {
          // Return the unwrapped destination for other items
          return destinationWidget;
        }
      }).toList(),
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (int index) => _onTap(context, index, ref),
    );
  }

  List<_NavigationItem> _navigationItems(BuildContext context) {
    return [
      _NavigationItem(
        // name: 'Home',
        name: S.of(context).home,
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
      ),
      // Library
      _NavigationItem(
        // name: 'Library',
        name: S.of(context).library,
        icon: Icons.book_outlined,
        activeIcon: Icons.book,
        // tooltip: 'Browse your library',
        tooltip: S.of(context).libraryTooltip,
      ),
      _NavigationItem(
        // name: 'Explore',
        name: S.of(context).explore,
        icon: Icons.search_outlined,
        activeIcon: Icons.search,
        // tooltip: 'Search and Explore',
        tooltip: S.of(context).exploreTooltip,
      ),
      _NavigationItem(
        // name: 'You',
        name: S.of(context).you,
        icon: Icons.account_circle_outlined,
        activeIcon: Icons.account_circle,
        // tooltip: 'Your Profile and Settings',
        tooltip: S.of(context).youTooltip,
      ),
    ];
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index, WidgetRef ref) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );

    // add the index to the stack but remove it if it is already there
    if (navigationShellStack.contains(index)) {
      navigationShellStack.remove(index);
    }
    navigationShellStack.add(index);
    appLogger.fine('Tapped index: $index, stack: $navigationShellStack');

    // Check if the current branch is the same as the branch that was tapped.
    if (index == navigationShell.currentIndex) {
      appLogger.fine('Tapped the current branch');

      // if current branch is explore, open the search view
      if (index == 2) {
        final searchController = ref.read(globalSearchControllerProvider);
        // open the search view if not already open
        if (!searchController.isOpen) {
          searchController.openView();
        } else {
          searchController.closeView(null);
        }
      }

      // open settings page if the current branch is you
      if (index == 3) {
        // do not open settings page if it is already open
        if (GoRouterState.of(context).topRoute?.name != Routes.settings.name) {
          GoRouter.of(context).pushNamed(Routes.settings.name);
        }
      }
    }
  }
}

// list of constants with names and icons so that they can be used in the bottom navigation bar
// and reused for nav rail and other places
// const _navigationItems = [
//   _NavigationItem(
//     name: 'Home',
//     icon: Icons.home_outlined,
//     activeIcon: Icons.home,
//   ),
//   // Library
//   _NavigationItem(
//     name: 'Library',
//     icon: Icons.book_outlined,
//     activeIcon: Icons.book,
//     tooltip: 'Browse your library',
//   ),
//   _NavigationItem(
//     name: 'Explore',
//     icon: Icons.search_outlined,
//     activeIcon: Icons.search,
//     tooltip: 'Search and Explore',
//   ),
//   _NavigationItem(
//     name: 'You',
//     icon: Icons.account_circle_outlined,
//     activeIcon: Icons.account_circle,
//     tooltip: 'Your Profile and Settings',
//   ),
// ];

class _NavigationItem {
  const _NavigationItem({
    required this.name,
    required this.icon,
    required this.activeIcon,
    this.tooltip,
  });

  final String name;
  final IconData icon;
  final IconData activeIcon;
  final String? tooltip;
}
