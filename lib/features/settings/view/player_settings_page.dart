import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/constants/sizes.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/view/buttons.dart';
import 'package:vaani/features/settings/view/simple_settings_page.dart';
import 'package:vaani/shared/extensions/duration_format.dart';
import 'package:vaani/shared/widgets/custom_dropdown.dart';

class PlayerSettingsPage extends HookConsumerWidget {
  const PlayerSettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final playerSettings = appSettings.playerSettings;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return SimpleSettingsPage(
      title: Text(S.of(context).playerSettings),
      sections: [
        SettingsSection(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: AppElementSizes.paddingLarge,
            vertical: AppElementSizes.paddingRegular,
          ),
          tiles: [
            // preferred settings for every book
            SettingsTile.switchTile(
              title: Text(S.of(context).playerSettingsRememberForEveryBook),
              leading: const Icon(Icons.settings_applications),
              description: Text(
                S.of(context).playerSettingsRememberForEveryBookDescription,
              ),
              initialValue: playerSettings.configurePlayerForEveryBook,
              onToggle: (value) {
                ref.read(appSettingsProvider.notifier).update(
                      appSettings.copyWith.playerSettings(
                        configurePlayerForEveryBook: value,
                      ),
                    );
              },
            ),

            // preferred default speed
            SettingsTile(
              title: Text(S.of(context).playerSettingsSpeedDefault),
              // trailing: Text(
              //   '${playerSettings.preferredDefaultSpeed}x',
              //   style:
              //       TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              // ),
              trailing: CustomDropdown<double>(
                selected: playerSettings.preferredDefaultSpeed,
                items: (f, cs) => playerSettings.speedOptions,
                itemAsString: (item) => '${item}x',
                onChanged: (value) {
                  if (value != null) {
                    ref.read(appSettingsProvider.notifier).update(
                          appSettings.copyWith.playerSettings(
                            preferredDefaultSpeed: value,
                          ),
                        );
                  }
                },
              ),
              leading: const Icon(Icons.speed),
            ),
            // preferred speed options
            SettingsTile(
              title: Text(S.of(context).playerSettingsSpeedOptions),
              description: Text(
                playerSettings.speedOptions.map((e) => '${e}x').join(', '),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
              ),
              leading: const Icon(Icons.speed),
              onPressed: (context) async {
                final newSpeedOptions = await showDialog<List<double>?>(
                  context: context,
                  builder: (context) => SpeedOptionsPicker(
                    initialValue: playerSettings.speedOptions,
                  ),
                );
                if (newSpeedOptions != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.playerSettings(
                          speedOptions: newSpeedOptions..sort(),
                        ),
                      );
                }
              },
            ),
          ],
        ),

        // Playback Reporting
        SettingsSection(
          title: Text(S.of(context).playerSettingsPlaybackReporting),
          tiles: [
            SettingsTile(
              title: Text(S.of(context).playerSettingsPlaybackReportingMinimum),
              description: Text.rich(
                TextSpan(
                  text: S
                      .of(context)
                      .playerSettingsPlaybackReportingMinimumDescriptionHead,
                  children: [
                    TextSpan(
                      text: playerSettings
                          .minimumPositionForReporting.smartBinaryFormat,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    TextSpan(
                        text: S
                            .of(context)
                            .playerSettingsPlaybackReportingMinimumDescriptionTail),
                  ],
                ),
              ),
              leading: const Icon(Icons.timer),
              onPressed: (context) async {
                final newDuration = await showDialog(
                  context: context,
                  builder: (context) {
                    return TimeDurationSelector(
                      title: Text(
                          S.of(context).playerSettingsPlaybackReportingIgnore),
                      baseUnit: BaseUnit.second,
                      initialValue: playerSettings.minimumPositionForReporting,
                    );
                  },
                );
                if (newDuration != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.playerSettings(
                          minimumPositionForReporting: newDuration,
                        ),
                      );
                }
              },
            ),
            // when to mark complete
            SettingsTile(
              title: Text(S.of(context).playerSettingsCompleteTime),
              description: Text.rich(
                TextSpan(
                  text: S.of(context).playerSettingsCompleteTimeDescriptionHead,
                  children: [
                    TextSpan(
                      text: playerSettings
                          .markCompleteWhenTimeLeft.smartBinaryFormat,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    TextSpan(
                        text: S
                            .of(context)
                            .playerSettingsCompleteTimeDescriptionTail),
                  ],
                ),
              ),
              leading: const Icon(Icons.cloud_done),
              onPressed: (context) async {
                final newDuration = await showDialog(
                  context: context,
                  builder: (context) {
                    return TimeDurationSelector(
                      title: Text(S.of(context).playerSettingsCompleteTime),
                      baseUnit: BaseUnit.second,
                      initialValue: playerSettings.markCompleteWhenTimeLeft,
                    );
                  },
                );
                if (newDuration != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.playerSettings(
                          markCompleteWhenTimeLeft: newDuration,
                        ),
                      );
                }
              },
            ),
            // playback report interval
            SettingsTile(
              title: Text(S.of(context).playerSettingsPlaybackInterval),
              description: Text.rich(
                TextSpan(
                  text: S
                      .of(context)
                      .playerSettingsPlaybackIntervalDescriptionHead,
                  children: [
                    TextSpan(
                      text: playerSettings
                          .playbackReportInterval.smartBinaryFormat,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    TextSpan(
                        text: S
                            .of(context)
                            .playerSettingsPlaybackIntervalDescriptionTail),
                  ],
                ),
              ),
              leading: const Icon(Icons.change_circle_outlined),
              onPressed: (context) async {
                final newDuration = await showDialog(
                  context: context,
                  builder: (context) {
                    return TimeDurationSelector(
                      title: Text(S.of(context).playerSettingsPlaybackInterval),
                      baseUnit: BaseUnit.second,
                      initialValue: playerSettings.playbackReportInterval,
                    );
                  },
                );
                if (newDuration != null) {
                  ref.read(appSettingsProvider.notifier).update(
                        appSettings.copyWith.playerSettings(
                          playbackReportInterval: newDuration,
                        ),
                      );
                }
              },
            ),
          ],
        ),
        // Display Settings
        SettingsSection(
          title: Text(S.of(context).playerSettingsDisplay),
          tiles: [
            // show total progress
            SettingsTile.switchTile(
              title: Text(S.of(context).playerSettingsDisplayTotalProgress),
              leading: const Icon(Icons.show_chart),
              description: Text(
                S.of(context).playerSettingsDisplayTotalProgressDescription,
              ),
              initialValue:
                  playerSettings.expandedPlayerSettings.showTotalProgress,
              onToggle: (value) {
                ref.read(appSettingsProvider.notifier).update(
                      appSettings.copyWith.playerSettings
                          .expandedPlayerSettings(showTotalProgress: value),
                    );
              },
            ),
            // show chapter progress
            SettingsTile.switchTile(
              title: Text(S.of(context).playerSettingsDisplayChapterProgress),
              leading: const Icon(Icons.show_chart),
              description: Text(
                S.of(context).playerSettingsDisplayChapterProgressDescription,
              ),
              initialValue:
                  playerSettings.expandedPlayerSettings.showChapterProgress,
              onToggle: (value) {
                ref.read(appSettingsProvider.notifier).update(
                      appSettings.copyWith.playerSettings(
                        expandedPlayerSettings: playerSettings
                            .expandedPlayerSettings
                            .copyWith(showChapterProgress: value),
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

class TimeDurationSelector extends HookConsumerWidget {
  const TimeDurationSelector({
    super.key,
    this.title = const Text('Select Duration'),
    this.baseUnit = BaseUnit.second,
    this.initialValue = Duration.zero,
  });

  final Widget title;
  final BaseUnit baseUnit;
  final Duration initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = useState(initialValue);
    return AlertDialog(
      title: title,
      content: DurationPicker(
        duration: duration.value,
        baseUnit: baseUnit,
        onChange: (value) {
          duration.value = value;
        },
      ),
      actions: [
        const CancelButton(),
        OkButton(
          onPressed: () {
            Navigator.of(context).pop(duration.value);
          },
        ),
      ],
    );
  }
}

class SpeedPicker extends HookConsumerWidget {
  const SpeedPicker({
    super.key,
    this.initialValue = 1,
  });

  final double initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speedController =
        useTextEditingController(text: initialValue.toString());
    final speed = useState<double?>(initialValue);
    return AlertDialog(
      title: Text(S.of(context).playerSettingsSpeedSelect),
      content: TextField(
        controller: speedController,
        onChanged: (value) => speed.value = double.tryParse(value),
        onSubmitted: (value) {
          Navigator.of(context).pop(speed.value);
        },
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: S.of(context).playerSettingsSpeed,
          helper: Text(S.of(context).playerSettingsSpeedSelectHelper),
        ),
      ),
      actions: [
        const CancelButton(),
        OkButton(
          onPressed: () {
            Navigator.of(context).pop(speed.value);
          },
        ),
      ],
    );
  }
}

class SpeedOptionsPicker extends HookConsumerWidget {
  const SpeedOptionsPicker({
    super.key,
    this.initialValue = const [0.75, 1, 1.25, 1.5, 1.75, 2],
  });

  final List<double> initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speedOptionAddController = useTextEditingController();
    final speedOptions = useState<List<double>>(initialValue);
    final focusNode = useFocusNode();
    return AlertDialog(
      title: Text(S.of(context).playerSettingsSpeedOptionsSelect),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: speedOptions.value
                .map(
                  (speed) => Chip(
                    label: Text('${speed}x'),
                    onDeleted: speed == 1
                        ? null
                        : () {
                            speedOptions.value =
                                speedOptions.value.where((element) {
                              // speed option 1 can't be removed
                              return element != speed;
                            }).toList();
                          },
                  ),
                )
                .toList()
              ..sort((a, b) {
                // if (a.label == const Text('1x')) {
                //   return -1;
                // } else if (b.label == const Text('1x')) {
                //   return 1;
                // }
                return a.label.toString().compareTo(b.label.toString());
              }),
          ),
          TextField(
            focusNode: focusNode,
            autofocus: true,
            controller: speedOptionAddController,
            onSubmitted: (value) {
              final newSpeed = double.tryParse(value);
              if (newSpeed != null && !speedOptions.value.contains(newSpeed)) {
                speedOptions.value = [...speedOptions.value, newSpeed];
              }
              speedOptionAddController.clear();
              focusNode.requestFocus();
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: S.of(context).playerSettingsSpeedOptionsSelectAdd,
              helper:
                  Text(S.of(context).playerSettingsSpeedOptionsSelectAddHelper),
            ),
          ),
        ],
      ),
      actions: [
        const CancelButton(),
        OkButton(
          onPressed: () {
            Navigator.of(context).pop(speedOptions.value);
          },
        ),
      ],
    );
  }
}
