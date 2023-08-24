import 'package:core/core.dart' show Bloc, Emitter;
import 'package:core/services/auth_service.dart';
import 'package:core/services/url_service.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:home_screen/home_screen.gm.dart';
import 'package:navigation/navigation.dart' show AppRouter;

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SignOutUseCase _signOutUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final FetchThemeUseCase _fetchThemeUseCase;
  final FetchTextScaleUseCase _fetchTextScaleUseCase;
  final SetThemeUseCase _setThemeUseCase;
  final SetTextScaleUseCase _setTextScaleUseCase;
  final AuthService _authService;
  final UrlService _urlService;
  final AppRouter _appRouter;

  SettingsBloc({
    required FetchThemeUseCase fetchThemeUseCase,
    required SetThemeUseCase setThemeUseCase,
    required FetchTextScaleUseCase fetchTextScaleUseCase,
    required SetTextScaleUseCase setTextScaleUseCase,
    required SignOutUseCase signOutUseCase,
    required CheckUserUseCase checkUserUseCase,
    required UrlService urlService,
    required AuthService authService,
    required AppRouter appRouter,
  })  : _setTextScaleUseCase = setTextScaleUseCase,
        _fetchTextScaleUseCase = fetchTextScaleUseCase,
        _urlService = urlService,
        _signOutUseCase = signOutUseCase,
        _checkUserUseCase = checkUserUseCase,
        _fetchThemeUseCase = fetchThemeUseCase,
        _setThemeUseCase = setThemeUseCase,
        _authService = authService,
        _appRouter = appRouter,
        super(const SettingsState(
          isDark: true,
          textScale: AppNumConstants.minScale,
        )) {
    on<SetThemeEvent>(_setTheme);
    on<SetTextScaleEvent>(_setTextScale);
    on<OpenLinkEvent>(_openLink);
    on<SignOutEvent>(_signOut);
    on<InitEvent>(_init);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<SettingsState> emit) {
    emit(
      state.copyWith(
        isDark: _fetchThemeUseCase.execute(const NoParams()),
        textScale: _fetchTextScaleUseCase.execute(const NoParams()),
      ),
    );
  }

  Future<void> _signOut(SignOutEvent event, Emitter<SettingsState> emit) async {
    await _signOutUseCase.execute(const NoParams());
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRoute());
  }

  Future<void> _openLink(
    OpenLinkEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _urlService.openDefault(Uri.parse(event.link));
  }

  Future<void> _setTheme(
    SetThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setThemeUseCase.execute(event.isDark);
    emit(
      state.copyWith(
        isDark: event.isDark,
      ),
    );
  }

  Future<void> _setTextScale(
    SetTextScaleEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setTextScaleUseCase.execute(event.textScale);
    emit(
      state.copyWith(
        textScale: event.textScale,
      ),
    );
  }
}
