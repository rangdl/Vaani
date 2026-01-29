import 'package:flutter/material.dart';

enum SheetDirection { left, right, top, bottom }

class SideSheet {
  SideSheet._();

  /// Open Left side sheet
  /// ```dart
  ///onPressed: () => SideSheet.left(body: Text("Body"), context: context)
  /// ```
  static Future<T?> left<T>(
    BuildContext context, {
    required Widget body,
    double? width,
    double? height,
    String barrierLabel = "Left Side Sheet",
    bool? barrierDismissible,
    Color? barrierColor,
    double? sheetBorderRadius,
    Color? sheetColor,
    Duration? transitionDuration,
    double? ratio,
  }) async {
    return show<T>(
      context,
      body: body,
      width: width,
      height: height,
      sheetDirection: SheetDirection.left,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
      transitionDuration: transitionDuration,
      ratio: ratio,
    );
  }

  /// Open Right side sheet
  /// ```dart
  ///onPressed: () => SideSheet.right(body: Text("Body"), context: context)
  /// ```
  static Future<T?> right<T>(
    BuildContext context, {
    required Widget body,
    double? width,
    double? height,
    String barrierLabel = "Right Side Sheet",
    bool? barrierDismissible,
    Color? barrierColor,
    double? sheetBorderRadius,
    Color? sheetColor,
    Duration? transitionDuration,
    double? ratio,
  }) async {
    return show<T>(
      context,
      body: body,
      width: width,
      height: height,
      sheetDirection: SheetDirection.right,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
      transitionDuration: transitionDuration,
      ratio: ratio,
    );
  }

  static Future<T?> top<T>(
    BuildContext context, {
    required Widget body,
    double? width,
    double? height,
    String barrierLabel = "Top Side Sheet",
    bool? barrierDismissible,
    Color? barrierColor,
    double? sheetBorderRadius,
    Color? sheetColor,
    Duration? transitionDuration,
    double? ratio,
  }) async {
    return show<T>(
      context,
      body: body,
      width: width,
      height: height,
      sheetDirection: SheetDirection.top,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
      transitionDuration: transitionDuration,
      ratio: ratio,
    );
  }

  static Future<T?> bottom<T>(
    BuildContext context, {
    required Widget body,
    double? width,
    double? height,
    String barrierLabel = "Bottom Side Sheet",
    bool? barrierDismissible,
    Color? barrierColor,
    double? sheetBorderRadius,
    Color? sheetColor,
    Duration? transitionDuration,
    double? ratio,
  }) async {
    return show<T>(
      context,
      body: body,
      width: width,
      height: height,
      sheetDirection: SheetDirection.bottom,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
      transitionDuration: transitionDuration,
      ratio: ratio,
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {

    /// Use this to pass any widget you want to display in the side sheet
    required Widget body,
    SheetDirection? sheetDirection,

    /// Use this to set the width of the side sheet
    double? width,
    double? height,
    String? barrierLabel,

    /// Use barrierDismissible to dismiss the side sheet by tapping outside of it
    bool? barrierDismissible,

    /// Use barrierColor to set the outside color of the side sheet when opened
    Color? barrierColor,

    /// Use sheetBorderRadius to set the outside border radius of the side sheet when opened
    double? sheetBorderRadius,

    /// Use sheetColor to set the color of the side sheet when opened
    /// Default is white
    Color? sheetColor,

    /// Use transitionDuration to set the duration of the animation when the side sheet is opened or closed
    Duration? transitionDuration,
    double? ratio,
  }) {
    sheetDirection ??= SheetDirection.right;
    barrierDismissible ??= true;
    barrierColor ??= const Color(0x80000000);
    sheetColor ??= Theme.of(context).colorScheme.surface;
    transitionDuration ??= const Duration(milliseconds: 200);

    final radius = Radius.circular(sheetBorderRadius ?? 0);
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: switch (sheetDirection) {
        SheetDirection.right => radius,
        SheetDirection.bottom => radius,
        _ => Radius.zero,
      },
      bottomLeft: switch (sheetDirection) {
        SheetDirection.right => radius,
        SheetDirection.top => radius,
        _ => Radius.zero,
      },
      topRight: switch (sheetDirection) {
        SheetDirection.left => radius,
        SheetDirection.bottom => radius,
        _ => Radius.zero,
      },
      bottomRight: switch (sheetDirection) {
        SheetDirection.left => radius,
        SheetDirection.top => radius,
        _ => Radius.zero,
      },
    );
    final alignment = switch (sheetDirection) {
      SheetDirection.left => Alignment.centerLeft,
      SheetDirection.right => Alignment.centerRight,
      SheetDirection.top => Alignment.topCenter,
      SheetDirection.bottom => Alignment.bottomCenter,
    };
    final x = switch (sheetDirection) {
      SheetDirection.left => -1.0,
      SheetDirection.right => 1.0,
      _ => 0.0,
    };
    final y = switch (sheetDirection) {
      SheetDirection.top => -1.0,
      SheetDirection.bottom => 1.0,
      _ => 0.0,
    };

    return showGeneralDialog<T>(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        final size = MediaQuery.of(context).size;
        return Align(
          alignment: alignment,
          child: Material(
            elevation: 15,
            color: Colors.transparent,
            borderRadius: borderRadius,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: sheetColor,
                borderRadius: borderRadius,
              ),
              height:
                  height ??
                  (sheetDirection == SheetDirection.top ||
                          sheetDirection == SheetDirection.bottom
                      ? size.height *
                            (ratio ??= size.height > size.width ? 0.3 : 0.8)
                      : double.infinity),
              width:
                  width ??
                  (sheetDirection == SheetDirection.left ||
                          sheetDirection == SheetDirection.right
                      ? size.width *
                            (ratio ??= size.height > size.width ? 0.8 : 0.3)
                      : double.infinity),
              child: body,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(
            begin: Offset(x, y),
            end: Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }
}
