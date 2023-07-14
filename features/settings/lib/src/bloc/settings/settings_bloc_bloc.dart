import 'package:bloc/bloc.dart';

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<SwitchThemeEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(isDark: true)) {
    on<SwitchThemeEvent>(_setTheme);
  }

  void _setTheme(SwitchThemeEvent event, Emitter<SettingsState> emit) {
    emit(SettingsState(isDark: event.isDark));
  }
}
