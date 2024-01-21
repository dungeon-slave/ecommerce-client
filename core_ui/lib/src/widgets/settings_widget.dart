import 'package:flutter/material.dart' show InheritedWidget, BuildContext;

class SettingsWidget extends InheritedWidget {
  final void Function(bool isDark) changeTheme;
  final void Function(double scale) changeTextScale;

  const SettingsWidget({
    required this.changeTheme,
    required this.changeTextScale,
    required super.child,
    super.key,
  });

  static SettingsWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingsWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant SettingsWidget oldWidget) => true;
}
