import 'package:core/core.dart';
import 'package:domain/usecase/authentication/check_user_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CheckUserUseCase _checkUserUseCase;
  final AuthService _authService;

  MainPageBloc({
    required CheckUserUseCase checkUserUseCase,
    required AuthService authService,
  })  : _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        super(const MainPageState(isChecked: false)) {
    on<InitEvent>(_checkUser);

    add(InitEvent());
  }

  void _checkUser(InitEvent event, Emitter<MainPageState> emit) {
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    emit(state.copyWith(isChecked: true));
  }
}
