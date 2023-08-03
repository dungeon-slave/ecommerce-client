import 'package:data/providers/local/hive_provider.dart';
import 'package:domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final HiveProvider _hiveProvider;

  const ThemeRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  bool getAppTheme() => _hiveProvider.getTheme();

  @override
  Future<void> saveAppTheme(bool isDark) => _hiveProvider.saveTheme(isDark);
}
