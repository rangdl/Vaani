import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/view/simple_settings_page.dart'
    show SimpleSettingsPage;

class HomePageSettingsPage extends HookConsumerWidget {
  const HomePageSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final appSettingsNotifier = ref.read(appSettingsProvider.notifier);

    return SimpleSettingsPage(
      title: Text(S.of(context).homePageSettings),
      sections: [
        SettingsSection(
          title: Text(S.of(context).homePageSettingsQuickPlay),
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          tiles: [
            SettingsTile.switchTile(
              initialValue: appSettings
                  .homePageSettings
                  .showPlayButtonOnContinueListeningShelf,
              title: Text(S.of(context).homeContinueListening),
              leading: const Icon(Icons.play_arrow),
              description: Text(
                S.of(context).homeBookContinueListeningDescription,
              ),
              onToggle: (value) {
                appSettingsNotifier.update(
                  appSettings.copyWith(
                    homePageSettings: appSettings.homePageSettings.copyWith(
                      showPlayButtonOnContinueListeningShelf: value,
                    ),
                  ),
                );
              },
            ),
            SettingsTile.switchTile(
              title: Text(S.of(context).homeBookContinueSeries),
              leading: const Icon(Icons.play_arrow),
              description: Text(
                S.of(context).homeBookContinueSeriesDescription,
              ),
              initialValue: appSettings
                  .homePageSettings
                  .showPlayButtonOnContinueSeriesShelf,
              onToggle: (value) {
                appSettingsNotifier.update(
                  appSettings.copyWith(
                    homePageSettings: appSettings.homePageSettings.copyWith(
                      showPlayButtonOnContinueSeriesShelf: value,
                    ),
                  ),
                );
              },
            ),
            SettingsTile.switchTile(
              title: Text(S.of(context).homePageSettingsOtherShelves),
              leading: const Icon(Icons.all_inclusive),
              description: Text(
                S.of(context).homePageSettingsOtherShelvesDescription,
              ),
              initialValue: appSettings
                  .homePageSettings
                  .showPlayButtonOnAllRemainingShelves,
              onToggle: (value) {
                appSettingsNotifier.update(
                  appSettings.copyWith(
                    homePageSettings: appSettings.homePageSettings.copyWith(
                      showPlayButtonOnAllRemainingShelves: value,
                    ),
                  ),
                );
              },
            ),
            SettingsTile.switchTile(
              title: Text(S.of(context).homeBookListenAgain),
              leading: const Icon(Icons.replay),
              description: Text(S.of(context).homeBookListenAgainDescription),
              initialValue:
                  appSettings.homePageSettings.showPlayButtonOnListenAgainShelf,
              onToggle: (value) {
                appSettingsNotifier.update(
                  appSettings.copyWith(
                    homePageSettings: appSettings.homePageSettings.copyWith(
                      showPlayButtonOnListenAgainShelf: value,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
