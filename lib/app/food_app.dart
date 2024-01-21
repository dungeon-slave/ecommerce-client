import 'package:core/core.dart' show AuthService;
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  ThemeData _currentTheme = AppTheme.dark;
  double _textScale = AppNumConstants.minScale;

  void _changeTheme(bool isDark) {
    setState(
      () => _currentTheme = isDark ? AppTheme.dark : AppTheme.light,
    );
  }

  void _changeTextScale(double scale) {
    setState(() => _textScale = scale);
  }

  @override
  Widget build(BuildContext context) {
    return SettingsWidget(
      changeTextScale: _changeTextScale,
      changeTheme: _changeTheme,
      child: MaterialApp.router(
        routerConfig: appLocator<AppRouter>().config(
          reevaluateListenable: appLocator<AuthService>(),
        ),
        builder: (_, Widget? child) => MediaQuery(
          data: const MediaQueryData().copyWith(
            textScaler: TextScaler.linear(_textScale),
          ),
          child: child ?? const SizedBox.shrink(),
        ),
        theme: _currentTheme,
      ),
    );
  }
}
