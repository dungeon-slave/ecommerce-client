import 'package:core/core.dart';
import 'package:domain/usecase/authentication/check_user_usecase.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:navigation/navigation.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CheckUserUseCase _checkUserUseCase;
  final AuthService _authService;
  final AppRouter _appRouter;

  MainPageBloc({
    required CheckUserUseCase checkUserUseCase,
    required AuthService authService,
    required AppRouter appRouter,
  })  : _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        _appRouter = appRouter,
        super(const MainPageState()) {
    on<InitEvent>(_getUser);

    add(InitEvent());
  }

  void _getUser(InitEvent event, Emitter<MainPageState> emit) {
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRouter());
  }
}
