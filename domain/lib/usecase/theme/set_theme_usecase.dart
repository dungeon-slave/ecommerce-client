import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

class SetThemeUseCase implements AsyncUseCase<bool, void> {
  final ThemeRepository _themeRepository;

  const SetThemeUseCase({required ThemeRepository themeRepository})
      : _themeRepository = themeRepository;

  @override
  Future<void> execute(bool input) => _themeRepository.saveAppTheme(input);
}
