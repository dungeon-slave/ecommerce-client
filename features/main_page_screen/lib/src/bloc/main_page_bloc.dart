import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecase/authentication/check_user_usecase.dart';
import 'package:domain/usecase/text_scale/fetch_text_scale_usecase.dart';
import 'package:domain/usecase/theme/fetch_theme_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final FetchThemeUseCase _fetchThemeUseCase;
  final FetchTextScaleUseCase _fetchTextScaleUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final AuthService _authService;

  MainPageBloc({
    required CheckUserUseCase checkUserUseCase,
    required FetchThemeUseCase fetchThemeUseCase,
    required FetchTextScaleUseCase fetchTextScaleUseCase,
    required AuthService authService,
  })  : _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        _fetchThemeUseCase = fetchThemeUseCase,
        _fetchTextScaleUseCase = fetchTextScaleUseCase,
        super(const MainPageState(
          isChecked: false,
          isDark: true,
          textScale: AppNumConstants.minScale,
        )) {
    on<InitEvent>(_init);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MainPageState> emit) {
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        isChecked: true,
        isDark: _fetchThemeUseCase.execute(const NoParams()),
        textScale: _fetchTextScaleUseCase.execute(const NoParams()),
      ),
    );
  }
}
