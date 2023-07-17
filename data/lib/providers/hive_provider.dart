import 'package:core/core.dart';

class HiveProvider {
  Future<void> saveTheme(bool isDark) async {
    final Box<bool> box = await Hive.openBox(_HiveKeys.themeBox);
    await box.put(_HiveKeys.themeKey, isDark);
  }

  Future<bool> getTheme() async {
    final Box<bool> box = await Hive.openBox(_HiveKeys.themeBox);
    return box.get(_HiveKeys.themeKey) ?? true;
  }
}

class _HiveKeys {
  static const String themeBox = 'AppTheme';
  static const String themeKey = 'Theme';
}
