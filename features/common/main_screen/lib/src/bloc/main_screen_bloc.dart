import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecase/authentication/check_user_role_usecase.dart';
import 'package:domain/usecase/text_scale/fetch_text_scale_usecase.dart';
import 'package:domain/usecase/theme/fetch_theme_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final FetchThemeUseCase _fetchThemeUseCase;
  final FetchTextScaleUseCase _fetchTextScaleUseCase;
  final CheckUserRoleUseCase _checkUserUseCase;
  final AuthService _authService;

  MainScreenBloc({
    required CheckUserRoleUseCase checkUserUseCase,
    required FetchThemeUseCase fetchThemeUseCase,
    required FetchTextScaleUseCase fetchTextScaleUseCase,
    required AuthService authService,
  })  : _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        _fetchThemeUseCase = fetchThemeUseCase,
        _fetchTextScaleUseCase = fetchTextScaleUseCase,
        super(const MainScreenState(
          isChecked: false,
          isDark: true,
          textScale: AppNumConstants.minScale,
        )) {
    on<InitEvent>(_init);

    add(InitEvent());
  }

  void _init(_, Emitter<MainScreenState> emit) {
    _authService.role = _checkUserUseCase.execute(const NoParams());

    emit(
      state.copyWith(
        isChecked: true,
        isDark: _fetchThemeUseCase.execute(const NoParams()),
        textScale: _fetchTextScaleUseCase.execute(const NoParams()),
      ),
    );
  }
}
