import 'package:core/core.dart' show Bloc, Emitter;
import 'package:core/services/auth_service.dart';
import 'package:domain/models/authentication/email_sign_up_model.dart';
import 'package:domain/usecase/authentication/check_user_usecase.dart';
import 'package:domain/usecase/authentication/email_sign_up_usecase.dart';
import 'package:domain/usecase/authentication/save_user_usecase.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:home_screen/home_screen.gm.dart';
import 'package:navigation/navigation.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final EmailSignUpUseCase _emailSignUpUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final AppRouter _appRouter;
  final AuthService _authService;

  SignUpBloc({
    required EmailSignUpUseCase emailSignUpUseCase,
    required SaveUserUseCase saveUserUseCase,
    required CheckUserUseCase checkUserUseCase,
    required AppRouter appRouter,
    required AuthService authService,
  })  : _emailSignUpUseCase = emailSignUpUseCase,
        _saveUserUseCase = saveUserUseCase,
        _checkUserUseCase = checkUserUseCase,
        _appRouter = appRouter,
        _authService = authService,
        super(const SignUpState()) {
    on<SignUpEvent>(_emailSignUp);
  }

  Future<void> _emailSignUp(
    SignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    String userId = await _emailSignUpUseCase.execute(event.data);
    await _saveUserUseCase.execute(userId);
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRoute());
    //TODO implement state change
  }
}
