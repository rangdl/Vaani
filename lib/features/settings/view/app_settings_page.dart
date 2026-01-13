import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/models/app_settings.dart' as model;
import 'package:vaani/features/settings/view/buttons.dart';
import 'package:vaani/features/settings/view/simple_settings_page.dart';
import 'package:vaani/features/settings/view/widgets/navigation_with_switch_tile.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/router/router.dart';
import 'package:vaani/shared/widgets/custom_dropdown.dart';

class AppSettingsPage extends HookConsumerWidget {
  const AppSettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final sleepTimerSettings = appSettings.sleepTimerSettings;
    final locales = {'en': 'English', 'zh': '中文'};
    return SimpleSettingsPage(
      title: Text(S.of(context).appSettings),
      sections: [
        // General section
        SettingsSection(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          title: Text(
            S.of(context).general,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          tiles: [
            SettingsTile(
              title: Text(S.of(context).language),
              leading: const Icon(Icons.language),
              trailing: CustomDropdown<String>(
                selected: appSettings.language,
                items: (f, cs) => S.delegate.supportedLocales.map((locale) {
                  return locale.languageCode;
                }).toList(),
                itemAsString: (item) => locales[item] ?? 'unknown',
                onChanged: (value) async => ref
                    .read(appSettingsProvider.notifier)
                    .update(appSettings.copyWith(language: value!)),
              ),
              // trailing: DropdownButton(
              //   value: appSettings.language,
              //   items: S.delegate.supportedLocales.map((locale) {
              //     return DropdownMenuItem(
              //       value: locale.languageCode,
              //       child: Text(locales[locale.languageCode] ?? 'unknown'),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     ref.read(appSettingsProvider.notifier).update(
              //           appSettings.copyWith(
              //             language: value!,
              //           ),
              //         );
              //   },
              // ),
              description: Text(S.of(context).languageDescription),
            ),
            SettingsTile(
              title: Text(S.of(context).playerSettings),
              leading: const Icon(Icons.play_arrow),
              description: Text(S.of(context).playerSettingsDescription),
              onPressed: (context) {
                context.pushNamed(Routes.playerSettings.name);
              },
            ),
            SettingsTile(
              title: Text(S.of(context).downloadSettings),
              leading: const Icon(Icons.download),
              description: Text(S.of(context).downloadSettingsDescription),
              onPressed: (context) {
                context.pushNamed(Routes.downloadSettings.name);
              },
            ),
            NavigationWithSwitchTile(
              title: Text(S.of(context).autoTurnOnSleepTimer),
              description: Text(S.of(context).automaticallyDescription),
              leading: sleepTimerSettings.autoTurnOnTimer
                  ? const Icon(Icons.timer, fill: 1)
                  : const Icon(Icons.timer_off, fill: 1),
              onPressed: (context) {
                context.pushNamed(Routes.autoSleepTimerSettings.name);
              },
              value: sleepTimerSettings.autoTurnOnTimer,
              onToggle: (value) {
                ref
                    .read(appSettingsProvider.notifier)
                    .update(
                      appSettings.copyWith.sleepTimerSettings(
                        autoTurnOnTimer: value,
                      ),
                    );
              },
            ),
            NavigationWithSwitchTile(
              title: Text(S.of(context).shakeDetector),
              leading: const Icon(Icons.vibration),
              description: Text(S.of(context).shakeDetectorDescription),
              value: appSettings.shakeDetectionSettings.isEnabled,
              onPressed: (context) {
                context.pushNamed(Routes.shakeDetectorSettings.name);
              },
              onToggle: (value) {
                ref
                    .read(appSettingsProvider.notifier)
                    .update(
                      appSettings.copyWith.shakeDetectionSettings(
                        isEnabled: value,
                      ),
                    );
              },
            ),
          ],
        ),

        // Appearance section
        SettingsSection(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          title: Text(
            S.of(context).appearance,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(Icons.color_lens),
              title: Text(S.of(context).themeSettings),
              description: Text(S.of(context).themeSettingsDescription),
              onPressed: (context) {
                context.pushNamed(Routes.themeSettings.name);
              },
            ),
            SettingsTile(
              title: Text(S.of(context).notificationMediaPlayer),
              leading: const Icon(Icons.play_lesson),
              description: Text(
                S.of(context).notificationMediaPlayerDescription,
              ),
              onPressed: (context) {
                context.pushNamed(Routes.notificationSettings.name);
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.home_filled),
              title: Text(S.of(context).homePageSettings),
              description: Text(S.of(context).homePageSettingsDescription),
              onPressed: (context) {
                context.pushNamed(Routes.homePageSettings.name);
              },
            ),
          ],
        ),

        // Backup and Restore section
        SettingsSection(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          title: Text(
            S.of(context).backupAndRestore,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          tiles: [
            SettingsTile(
              title: Text(S.of(context).copyToClipboard),
              leading: const Icon(Icons.copy),
              description: Text(S.of(context).copyToClipboardDescription),
              onPressed: (context) async {
                // copy to clipboard
                await Clipboard.setData(
                  ClipboardData(text: jsonEncode(appSettings.toJson())),
                );
                // show toast
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).copyToClipboardToast)),
                );
              },
            ),
            SettingsTile(
              title: Text(S.of(context).restore),
              leading: const Icon(Icons.restore),
              description: Text(S.of(context).restoreDescription),
              onPressed: (context) {
                // show a dialog to get the backup
                showDialog(
                  context: context,
                  builder: (context) {
                    return RestoreDialogue();
                  },
                );
              },
            ),

            // a button to reset the app settings
            SettingsTile(
              title: Text(S.of(context).resetAppSettings),
              leading: const Icon(Icons.settings_backup_restore),
              description: Text(S.of(context).resetAppSettingsDescription),
              onPressed: (context) async {
                // confirm the reset
                final res = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(S.of(context).resetAppSettings),
                      content: Text(S.of(context).resetAppSettingsDialog),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(S.of(context).cancel),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(S.of(context).reset),
                        ),
                      ],
                    );
                  },
                );

                // if the user confirms the reset
                if (res == true) {
                  ref.read(appSettingsProvider.notifier).reset();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

class RestoreDialogue extends HookConsumerWidget {
  const RestoreDialogue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final settings = useState<model.AppSettings?>(null);

    final settingsInputController = useTextEditingController();
    return AlertDialog(
      title: Text(S.of(context).restoreBackup),
      content: Form(
        key: formKey,
        child: TextFormField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: S.of(context).backup,
            hintText: S.of(context).restoreBackupHint,
            // clear button
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                settingsInputController.clear();
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).restoreBackupValidator;
            }
            try {
              // try to decode the backup
              settings.value = model.AppSettings.fromJson(jsonDecode(value));
            } catch (e) {
              return S.of(context).restoreBackupInvalid;
            }
            return null;
          },
        ),
      ),
      actions: [
        CancelButton(),
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (settings.value == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).restoreBackupInvalid)),
                );
                return;
              }
              ref.read(appSettingsProvider.notifier).update(settings.value!);
              settingsInputController.clear();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).restoreBackupSuccess)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).restoreBackupInvalid)),
              );
            }
          },
          child: Text(S.of(context).restore),
        ),
      ],
    );
  }
}
