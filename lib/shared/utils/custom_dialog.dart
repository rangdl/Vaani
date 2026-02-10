import 'package:flutter/material.dart';
import 'package:vaani/l10n/generated/l10n.dart';

class DialogUtils {
  DialogUtils._();

  // 自定义确认框 dialog
  static Future<bool?> showConfirmDialog(
    BuildContext context, {
    String title = '确认',
    String content = '确定要执行此操作吗？',
    String? confirmText,
    String? cancelText,
    Function()? onPressed,
  }) async {
    final colorScheme = Theme.of(context).colorScheme;
    // theme.buttonTheme.
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(cancelText ?? S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              }
              Navigator.of(context).pop(false);
            },
            style: TextButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
            child: Text(confirmText ?? S.of(context).ok),
          ),
        ],
      ),
    );
  }
}
