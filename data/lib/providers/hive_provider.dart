import 'package:core/core.dart';

class HiveProvider {
  late final Box<bool> _themeBox;

  Future<void> openBoxes() async {
    _themeBox = await Hive.openBox(_HiveKeys.themeBox);
  }

  Future<void> saveTheme(bool isDark) async =>
      await _themeBox.put(_HiveKeys.themeKey, isDark);

  Future<bool> getTheme() async => _themeBox.get(_HiveKeys.themeKey) ?? true;
}

class _HiveKeys {
  static const String themeBox = 'AppTheme';
  static const String themeKey = 'Theme';
}
