import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/settings/app_settings_provider.dart';
import 'package:vaani/settings/view/simple_settings_page.dart';
import 'package:vaani/shared/extensions/time_of_day.dart';

class AutoSleepTimerSettingsPage extends HookConsumerWidget {
  const AutoSleepTimerSettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final sleepTimerSettings = appSettings.sleepTimerSettings;

    var enabled = sleepTimerSettings.autoTurnOnTimer &&
        !sleepTimerSettings.alwaysAutoTurnOnTimer;
    final selectedValueColor = enabled
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).disabledColor;
    return SimpleSettingsPage(
      title: Text(S.of(context).autoSleepTimerSettings),
      sections: [
        SettingsSection(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          tiles: [
            SettingsTile.switchTile(
              // initialValue: sleepTimerSettings.autoTurnOnTimer,
              title: Text(S.of(context).autoTurnOnTimer),
              description: Text(
                S.of(context).autoTurnOnTimerDescription,
              ),
              leading: sleepTimerSettings.autoTurnOnTimer
                  ? const Icon(Icons.timer_outlined)
                  : const Icon(Icons.timer_off_outlined),
              onToggle: (value) {
                ref.read(appSettingsProvider.notifier).update(
                      appSettings.copyWith.sleepTimerSettings(
                        autoTurnOnTimer: value,
                      ),
                    );
              },
              initialValue: sleepTimerSettings.autoTurnOnTimer,
            ),
            // auto turn on time settings, enabled only when autoTurnOnTimer is enabled
            SettingsTile.navigation(
              enabled: enabled,
              leading: const Icon(Icons.play_circle),
              title: Text(S.of(context).autoTurnOnTimerFrom),
              description: Text(
                S.of(context).autoTurnOnTimerFromDescription,
              ),
              onPressed: (context) async {
                // navigate to the time picker
                final selected = await showTimePicker(
                  context: context,
                  initialTime: sleepTimerSettings.autoTurnOnTime.toTimeOfDay(),
                );
                if (selected != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.sleepTimerSettings(
                          autoTurnOnTime: selected.toDuration(),
                        ),
                      );
                }
              },
              trailing: Text(
                sleepTimerSettings.autoTurnOnTime.toTimeOfDay().format(context),
                style: TextStyle(color: selectedValueColor),
              ),
            ),
            SettingsTile.navigation(
              enabled: enabled,
              leading: const Icon(Icons.pause_circle),
              title: Text(S.of(context).autoTurnOnTimerUntil),
              description: Text(
                S.of(context).autoTurnOnTimerUntilDescription,
              ),
              onPressed: (context) async {
                // navigate to the time picker
                final selected = await showTimePicker(
                  context: context,
                  initialTime: sleepTimerSettings.autoTurnOffTime.toTimeOfDay(),
                );
                if (selected != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.sleepTimerSettings(
                          autoTurnOffTime: selected.toDuration(),
                        ),
                      );
                }
              },
              trailing: Text(
                sleepTimerSettings.autoTurnOffTime
                    .toTimeOfDay()
                    .format(context),
                style: TextStyle(color: selectedValueColor),
              ),
            ),

            // switch tile for always auto turn on timer no matter what
            SettingsTile.switchTile(
              leading: const Icon(Icons.all_inclusive),
              title: Text(S.of(context).autoTurnOnTimerAlways),
              description: Text(
                S.of(context).autoTurnOnTimerAlwaysDescription,
              ),
              onToggle: (value) {
                ref.read(appSettingsProvider.notifier).update(
                      appSettings.copyWith.sleepTimerSettings(
                        alwaysAutoTurnOnTimer: value,
                      ),
                    );
              },
              enabled: sleepTimerSettings.autoTurnOnTimer,
              initialValue: sleepTimerSettings.alwaysAutoTurnOnTimer,
            ),
          ],
        ),
      ],
    );
  }
}
