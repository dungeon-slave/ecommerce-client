import 'package:bloc/bloc.dart';
import 'package:core/services/auth_service.dart';
import 'package:core/services/url_service.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SetThemeUseCase _setThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;
  final SignOutUseCase _signOutUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final SetTextScaleUseCase _setTextScaleUseCase;
  final GetTextScaleUseCase _getTextScaleUseCase;
  final AuthService _authService;
  final UrlService _urlService;

  SettingsBloc({
    required SetThemeUseCase setThemeUseCase,
    required GetThemeUseCase getThemeUseCase,
    required SetTextScaleUseCase setTextScaleUseCase,
    required GetTextScaleUseCase getTextScaleUseCase,
    required SignOutUseCase signOutUseCase,
    required CheckUserUseCase checkUserUseCase,
    required UrlService urlService,
    required AuthService authService,
  })  : _getThemeUseCase = getThemeUseCase,
        _setTextScaleUseCase = setTextScaleUseCase,
        _getTextScaleUseCase = getTextScaleUseCase,
        _urlService = urlService,
        _signOutUseCase = signOutUseCase,
        _checkUserUseCase = checkUserUseCase,
        _setThemeUseCase = setThemeUseCase,
        _authService = authService,
        super(SettingsState(
          isDark: true,
          textScale: AppConstants.textScales[1],
        )) {
    on<SetThemeEvent>(_setTheme);
    on<GetThemeEvent>(_getTheme);
    on<SetTextScaleEvent>(_setTextScale);
    on<GetTextScaleEvent>(_getTextScale);
    on<OpenLinkEvent>(_openLink);
    on<SignOutEvent>(_signOut);

    add(GetThemeEvent());
    add(GetTextScaleEvent());
  }

  Future<void> _signOut(SignOutEvent event, Emitter<SettingsState> emit) async {
    await _signOutUseCase.execute(const NoParams());
    _authService.authenticated =
        _checkUserUseCase.execute(const NoParams());
  }

  Future<void> _openLink(OpenLinkEvent event, Emitter<SettingsState> emit) async {
    _urlService.openDefault(event.link);
  }

  Future<void> _setTheme(SetThemeEvent event, Emitter<SettingsState> emit) async {
    await _setThemeUseCase.execute(event.isDark);
    emit(
      state.copyWith(
        isDark: event.isDark,
      ),
    );
  }

  Future<void> _setTextScale(
      SetTextScaleEvent event, Emitter<SettingsState> emit) async {
    await _setTextScaleUseCase.execute(event.textScale);
    emit(
      state.copyWith(
        textScale: event.textScale,
      ),
    );
  }

  void _getTheme(GetThemeEvent event, Emitter<SettingsState> emit) {
    emit(
      state.copyWith(
        isDark: _getThemeUseCase.execute(const NoParams()),
      ),
    );
  }

  void _getTextScale(GetTextScaleEvent event, Emitter<SettingsState> emit) {
    emit(
      state.copyWith(
        textScale: _getTextScaleUseCase.execute(
          const NoParams(),
        ),
      ),
    );
  }
}
