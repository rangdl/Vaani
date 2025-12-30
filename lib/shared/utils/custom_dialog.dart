import 'package:flutter/material.dart';
import 'package:vaani/generated/l10n.dart';

class DialogUtils {
  DialogUtils._();

  // 自定义删除 dialog
  static deleteDialog(
    BuildContext context, {
    String? name,
    required Function() onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).delete),
          content: Text(S.of(context).deleteDialog(name ?? '')),
          actions: [
            TextButton(
              onPressed: () {
                onPressed();
                Navigator.pop(context);
              },
              child: Text(S.of(context).yes),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(S.of(context).no),
            ),
          ],
        );
      },
    );
  }
}
