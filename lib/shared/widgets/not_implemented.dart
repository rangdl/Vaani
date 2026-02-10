import 'package:flutter/material.dart';
import 'package:vaani/l10n/generated/l10n.dart';

void showNotImplementedToast(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(S.of(context).notImplemented), showCloseIcon: true),
  );
}
