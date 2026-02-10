import 'package:flutter/material.dart';
import 'package:vaani/l10n/generated/l10n.dart';

class OkButton<T> extends StatelessWidget {
  const OkButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(S.of(context).ok));
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
        Navigator.of(context).pop();
      },
      child: Text(S.of(context).cancel),
    );
  }
}
