import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/models/app_settings.dart';
import 'package:vaani/features/settings/view/buttons.dart';
import 'package:vaani/features/settings/view/simple_settings_page.dart';
import 'package:vaani/shared/extensions/enum.dart';

class NotificationSettingsPage extends HookConsumerWidget {
  const NotificationSettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final notificationSettings = appSettings.notificationSettings;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return SimpleSettingsPage(
      title: Text(S.of(context).notificationMediaPlayer),
      sections: [
        SettingsSection(
          margin: const EdgeInsetsDirectional.only(
            start: 16.0,
            end: 16.0,
            top: 8.0,
            bottom: 8.0,
          ),
          tiles: [
            // set the primary and secondary titles
            SettingsTile(
              title: Text(S.of(context).nmpSettingsTitle),
              description: Text.rich(
                TextSpan(
                  text: S.of(context).nmpSettingsTitleDescription,
                  children: [
                    TextSpan(
                      text: notificationSettings.primaryTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              leading: const Icon(Icons.title),
              onPressed: (context) async {
                // show the notification title picker
                final selectedTitle = await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return NotificationTitlePicker(
                      initialValue: notificationSettings.primaryTitle,
                      title: S.of(context).nmpSettingsTitle,
                    );
                  },
                );
                if (selectedTitle != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.notificationSettings(
                          primaryTitle: selectedTitle,
                        ),
                      );
                }
              },
            ),

            SettingsTile(
              title: Text(S.of(context).nmpSettingsSubTitle),
              description: Text.rich(
                TextSpan(
                  text: S.of(context).nmpSettingsSubTitleDescription,
                  children: [
                    TextSpan(
                      text: notificationSettings.secondaryTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              leading: const Icon(Icons.title),
              onPressed: (context) async {
                // show the notification title picker
                final selectedTitle = await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return NotificationTitlePicker(
                      initialValue: notificationSettings.secondaryTitle,
                      title: S.of(context).nmpSettingsSubTitle,
                    );
                  },
                );
                if (selectedTitle != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.notificationSettings(
                          secondaryTitle: selectedTitle,
                        ),
                      );
                }
              },
            ),

            // set forward and backward intervals
            SettingsTile(
              title: Text(S.of(context).nmpSettingsForward),
              description: Row(
                children: [
                  Text(
                    S.of(context).timeSecond(
                          notificationSettings.fastForwardInterval.inSeconds,
                        ),
                  ),
                  Expanded(
                    child: TimeIntervalSlider(
                      defaultValue: notificationSettings.fastForwardInterval,
                      onChangedEnd: (interval) {
                        ref.read(appSettingsProvider.notifier).update(
                              appSettings.copyWith.notificationSettings(
                                fastForwardInterval: interval,
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
              leading: const Icon(Icons.fast_forward),
            ),
            SettingsTile(
              title: Text(S.of(context).nmpSettingsBackward),
              description: Row(
                children: [
                  Text(
                    S.of(context).timeSecond(
                          notificationSettings.rewindInterval.inSeconds,
                        ),
                  ),
                  Expanded(
                    child: TimeIntervalSlider(
                      defaultValue: notificationSettings.rewindInterval,
                      onChangedEnd: (interval) {
                        ref.read(appSettingsProvider.notifier).update(
                              appSettings.copyWith.notificationSettings(
                                rewindInterval: interval,
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
              leading: const Icon(Icons.fast_rewind),
            ),
            // set the media controls
            SettingsTile(
              title: Text(S.of(context).nmpSettingsMediaControls),
              leading: const Icon(Icons.control_camera),
              // description: const Text('Select the media controls to display'),
              description:
                  Text(S.of(context).nmpSettingsMediaControlsDescription),
              trailing: Wrap(
                spacing: 8.0,
                children: notificationSettings.mediaControls
                    .map(
                      (control) => Icon(
                        control.icon,
                        color: primaryColor,
                      ),
                    )
                    .toList(),
              ),
              onPressed: (context) async {
                final selectedControls =
                    await showDialog<List<NotificationMediaControl>>(
                  context: context,
                  builder: (context) {
                    return MediaControlsPicker(
                      selectedControls: notificationSettings.mediaControls,
                    );
                  },
                );
                if (selectedControls != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.notificationSettings(
                          mediaControls: selectedControls,
                        ),
                      );
                }
              },
            ),

            // set the progress bar to show chapter progress
            SettingsTile.switchTile(
              title: Text(S.of(context).nmpSettingsShowChapterProgress),
              leading: const Icon(Icons.book),
              description:
                  Text(S.of(context).nmpSettingsShowChapterProgressDescription),
              initialValue: notificationSettings.progressBarIsChapterProgress,
              onToggle: (value) {
                ref.read(appSettingsProvider.notifier).update(
                      appSettings.copyWith.notificationSettings(
                        progressBarIsChapterProgress: value,
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

class MediaControlsPicker extends HookConsumerWidget {
  const MediaControlsPicker({
    super.key,
    required this.selectedControls,
  });

  final List<NotificationMediaControl> selectedControls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMediaControls = useState(selectedControls);
    return AlertDialog(
      title: Text(S.of(context).nmpSettingsMediaControls),
      actions: [
        const CancelButton(),
        OkButton(
          onPressed: () {
            Navigator.of(context).pop(selectedMediaControls.value);
          },
        ),
      ],
      // a list of chips to easily select the media controls to display
      // with icons and labels
      content: Wrap(
        spacing: 8.0,
        children: NotificationMediaControl.values
            .map(
              (control) => ChoiceChip(
                avatar: Icon(control.icon),
                label: Text(control.pascalCase),
                selected: selectedMediaControls.value.contains(control),
                onSelected: (selected) {
                  if (selected) {
                    selectedMediaControls.value = [
                      ...selectedMediaControls.value,
                      control,
                    ];
                  } else {
                    selectedMediaControls.value = [
                      ...selectedMediaControls.value.where((c) => c != control),
                    ];
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class TimeIntervalSlider extends HookConsumerWidget {
  const TimeIntervalSlider({
    super.key,
    this.title,
    required this.defaultValue,
    this.onChanged,
    this.onChangedEnd,
    this.min = const Duration(seconds: 5),
    this.max = const Duration(seconds: 120),
    this.step = const Duration(seconds: 5),
  });

  final Widget? title;
  final Duration defaultValue;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEnd;
  final Duration min;
  final Duration max;
  final Duration step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedInterval = useState(defaultValue);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        title ?? const SizedBox.shrink(),
        if (title != null) const SizedBox(height: 8.0),
        Slider(
          value: selectedInterval.value.inSeconds.toDouble(),
          min: min.inSeconds.toDouble(),
          max: max.inSeconds.toDouble(),
          divisions: ((max.inSeconds - min.inSeconds) ~/ step.inSeconds),
          label: S.of(context).timeSecond(selectedInterval.value.inSeconds),
          onChanged: (value) {
            selectedInterval.value = Duration(seconds: value.toInt());
            onChanged?.call(selectedInterval.value);
          },
          onChangeEnd: (value) {
            onChangedEnd?.call(selectedInterval.value);
          },
        ),
      ],
    );
  }
}

class NotificationTitlePicker extends HookConsumerWidget {
  const NotificationTitlePicker({
    super.key,
    required this.initialValue,
    required this.title,
  });

  final String initialValue;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTitle = useState(initialValue);
    final controller = useTextEditingController(text: initialValue);
    return AlertDialog(
      title: Text(title),
      actions: [
        const CancelButton(),
        OkButton(
          onPressed: () {
            Navigator.of(context).pop(selectedTitle.value);
          },
        ),
      ],
      // a list of chips to easily insert available fields into the text field
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            controller: controller,
            onChanged: (value) {
              selectedTitle.value = value;
            },
            decoration: InputDecoration(
              helper: Text(S.of(context).nmpSettingsSelectOne),
              suffix: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                  selectedTitle.value = '';
                },
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            children: NotificationTitleType.values
                .map(
                  (type) => ActionChip(
                    label: Text(type.pascalCase),
                    onPressed: () {
                      final text = controller.text;
                      final newText = '$text\$${type.name}';
                      controller.text = newText;
                      selectedTitle.value = newText;
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
