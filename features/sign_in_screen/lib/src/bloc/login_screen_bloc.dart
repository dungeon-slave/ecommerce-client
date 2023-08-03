import 'package:bloc/bloc.dart';
import 'package:core/services/auth_service.dart';
import 'package:domain/models/authentication/email_sign_in_model.dart';
import 'package:domain/models/authentication/email_sign_up_model.dart';
import 'package:domain/usecase/authentication/check_user_usecase.dart';
import 'package:domain/usecase/authentication/email_sign_in_usecase.dart';
import 'package:domain/usecase/authentication/google_sign_in_usecase.dart';
import 'package:domain/usecase/authentication/save_user_usecase.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:navigation/navigation.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final EmailSignInUseCase _emailSignInUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final AuthService _authService;
  final AppRouter _appRouter;

  LoginScreenBloc({
    required GoogleSignInUseCase googleSignInUseCase,
    required EmailSignInUseCase emailSignInUseCase,
    required SaveUserUseCase saveUserUseCase,
    required CheckUserUseCase checkUserUseCase,
    required AuthService authService,
    required AppRouter appRouter,
  })  : _saveUserUseCase = saveUserUseCase,
        _googleSignInUseCase = googleSignInUseCase,
        _emailSignInUseCase = emailSignInUseCase,
        _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        _appRouter = appRouter,
        super(LoginScreenInitial()) {
    on<EmailSignInEvent>(_emailSignIn);
    on<GoogleSignInEvent>(_googleSignIn);
  }

  Future<void> _emailSignIn(
      EmailSignInEvent event, Emitter<LoginScreenState> emit) async {
    String userId = await _emailSignInUseCase.execute(event.model);
    await _saveUserUseCase.execute(userId);
    _authService.authenticated =
        _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRouter());
    //TODO implement state change
  }

  Future<void> _googleSignIn(
      GoogleSignInEvent event, Emitter<LoginScreenState> emit) async {
    String userId = await _googleSignInUseCase.execute(const NoParams());
    await _saveUserUseCase.execute(userId);
    _authService.authenticated =
        _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRouter());
    //TODO implement state change
  }
}
