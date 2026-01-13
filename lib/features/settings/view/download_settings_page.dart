import 'dart:io';

import 'package:duration_picker/duration_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vaani/features/settings/app_settings_provider.dart';
import 'package:vaani/features/settings/view/buttons.dart';
import 'package:vaani/features/settings/view/simple_settings_page.dart';
import 'package:vaani/generated/l10n.dart';
import 'package:vaani/globals.dart';

class DownloadSettingsPage extends HookConsumerWidget {
  const DownloadSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final downloadSettings = appSettings.downloadSettings;
    // final primaryColor = Theme.of(context).colorScheme.primary;

    return SimpleSettingsPage(
      title: Text(S.of(context).playerSettings),
      sections: [
        SettingsSection(
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          tiles: [
            // preferred settings for every book
            if (Platform.isWindows)
              SettingsTile(
                title: Text('下载目录'),
                leading: const Icon(Icons.folder_open_rounded),
                description: Text('自定义下载目录'),
                trailing: Text(downloadSettings.path),
                onPressed: (context) async {
                  String? selectedDirectory = await FilePicker.platform
                      .getDirectoryPath();
                  appLogger.info(selectedDirectory);
                  if (selectedDirectory != null) {
                    ref
                        .read(appSettingsProvider.notifier)
                        .update(
                          appSettings.copyWith.downloadSettings(
                            path: selectedDirectory,
                          ),
                        );
                  }
                },
              ),
            SettingsTile(
              title: Text('并发数'),
              leading: const Icon(Icons.folder_open_rounded),
              description: Text('下载任务并发数'),
              trailing: Text('${downloadSettings.maxConcurrent}'),
              onPressed: (context) async {},
            ),
            SettingsTile(
              title: Text('Host并发数'),
              leading: const Icon(Icons.folder_open_rounded),
              description: Text('同一Host并发连接数'),
              trailing: Text('${downloadSettings.maxConcurrentByHost}'),
              onPressed: (context) async {},
            ),
            SettingsTile(
              title: Text('分组并发数'),
              leading: const Icon(Icons.folder_open_rounded),
              description: Text('同一分组并发数'),
              trailing: Text('${downloadSettings.maxConcurrentByGroup}'),
              onPressed: (context) async {},
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
  const SpeedPicker({super.key, this.initialValue = 1});

  final double initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speedController = useTextEditingController(
      text: initialValue.toString(),
    );
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
            children:
                speedOptions.value
                    .map(
                      (speed) => Chip(
                        label: Text('${speed}x'),
                        onDeleted: speed == 1
                            ? null
                            : () {
                                speedOptions.value = speedOptions.value.where((
                                  element,
                                ) {
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
              helper: Text(
                S.of(context).playerSettingsSpeedOptionsSelectAddHelper,
              ),
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
