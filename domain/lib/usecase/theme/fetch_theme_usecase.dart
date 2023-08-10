import 'package:domain/repositories/theme_repository.dart';
import 'package:domain/usecase/usecase.dart';

class FetchThemeUseCase implements UseCase<NoParams, bool> {
  final ThemeRepository _themeRepository;

  const FetchThemeUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  @override
  bool execute(NoParams input) => _themeRepository.fetchAppTheme();
}
