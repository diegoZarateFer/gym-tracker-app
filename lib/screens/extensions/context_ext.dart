import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  void showBottomDialog(Widget content) {
    showModalBottomSheet(
      context: this,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (modalContext) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: content,
        );
      },
    );
  }
}
