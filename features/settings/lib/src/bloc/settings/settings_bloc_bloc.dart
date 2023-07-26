import 'package:bloc/bloc.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/theme/set_theme_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<ThemeEvent, SettingsState> {
  final SetThemeUseCase _setThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;

  final SetTextScaleUseCase _setTextScaleUseCase;
  final GetTextScaleUseCase _getTextScaleUseCase;

  SettingsBloc({
    required SetThemeUseCase setThemeUseCase,
    required GetThemeUseCase getThemeUseCase,
    required SetTextScaleUseCase setTextScaleUseCase,
    required GetTextScaleUseCase getTextScaleUseCase,
  })  : _setThemeUseCase = setThemeUseCase,
        _getThemeUseCase = getThemeUseCase,
        _setTextScaleUseCase = setTextScaleUseCase,
        _getTextScaleUseCase = getTextScaleUseCase,
        super(SettingsState(
          isDark: true,
          textScale: AppConstants.textScales[0],
        )) {
    on<SetThemeEvent>(_setTheme);
    on<GetThemeEvent>(_getTheme);
    on<SetTextScaleEvent>(_setTextScale);
    on<GetTextScaleEvent>(_getTextScale);
    add(GetThemeEvent());
    add(GetTextScaleEvent());
  }

  void _setTheme(SetThemeEvent event, Emitter<SettingsState> emit) {
    _setThemeUseCase.execute(event.isDark);
    emit(SettingsState(
      isDark: event.isDark,
      textScale: state.textScale,
    ));
  }

  void _setTextScale(SetTextScaleEvent event, Emitter<SettingsState> emit) {
    _setTextScaleUseCase.execute(event.textScale);
    emit(SettingsState(
      isDark: state.isDark,
      textScale: event.textScale,
    ));
  }

  void _getTheme(GetThemeEvent event, Emitter<SettingsState> emit) {
    emit(
      SettingsState(
        isDark: _getThemeUseCase.execute(const NoParams()),
        textScale: state.textScale,
      ),
    );
  }

  void _getTextScale(GetTextScaleEvent event, Emitter<SettingsState> emit) {
    emit(
      SettingsState(
        isDark: state.isDark,
        textScale: _getTextScaleUseCase.execute(const NoParams()),
      ),
    );
  }
}
