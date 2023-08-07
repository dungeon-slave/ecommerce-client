abstract class ThemeRepository {
  Future<void> saveAppTheme(bool isDark);
  bool fetchAppTheme();
}
