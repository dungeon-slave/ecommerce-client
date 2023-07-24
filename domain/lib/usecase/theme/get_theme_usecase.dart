import 'package:domain/repositories/theme_repository.dart';
import 'package:domain/usecase/usecase.dart';

class GetThemeUseCase implements UseCase<NoParams, bool> {
  final ThemeRepository _themeRepository;
  
  const GetThemeUseCase({required ThemeRepository themeRepository})
      : _themeRepository = themeRepository;

  @override
  bool execute(NoParams input) => _themeRepository.getAppTheme();
}
