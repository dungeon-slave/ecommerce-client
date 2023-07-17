import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/theme/set_theme_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<ThemeEvent, SettingsState> {
  final SetThemeUseCase _setThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;

  SettingsBloc(
      {required SetThemeUseCase setThemeUseCase,
      required GetThemeUseCase getThemeUseCase})
      : _setThemeUseCase = setThemeUseCase,
        _getThemeUseCase = getThemeUseCase,
        super(SettingsState(isDark: true)) {
    on<SetThemeEvent>(_setTheme);
    on<GetThemeEvent>(_getTheme);
    add(GetThemeEvent(themeKey: 'Theme'));
  }

  void _setTheme(SetThemeEvent event, Emitter<SettingsState> emit) {
    _setThemeUseCase.execute(event.isDark);
    emit(SettingsState(isDark: event.isDark));
  }

  void _getTheme(GetThemeEvent event, Emitter<SettingsState> emit) async   {
    emit(SettingsState(isDark:  await _getThemeUseCase.execute(const NoParams())));
  }
}
