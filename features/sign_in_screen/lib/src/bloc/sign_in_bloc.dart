import 'package:core/core.dart' show Bloc, Emitter;
import 'package:core/services/auth_service.dart';
import 'package:domain/models/authentication/email_sign_in_model.dart';
import 'package:domain/usecase/authentication/check_user_usecase.dart';
import 'package:domain/usecase/authentication/email_sign_in_usecase.dart';
import 'package:domain/usecase/authentication/google_sign_in_usecase.dart';
import 'package:domain/usecase/authentication/save_user_usecase.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:home_screen/home_screen.gm.dart';
import 'package:navigation/navigation.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final EmailSignInUseCase _emailSignInUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final AuthService _authService;
  final AppRouter _appRouter;

  SignInBloc({
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
        super(const LoginScreenState(errorMessage: '')) {
    on<EmailSignInEvent>(_emailSignIn);
    on<GoogleSignInEvent>(_googleSignIn);
  }

  Future<void> _emailSignIn(
      EmailSignInEvent event, Emitter<LoginScreenState> emit) async {
    try {
      String userId = await _emailSignInUseCase.execute(event.model);
      await _saveUserUseCase.execute(userId);
      _authService.authenticated = _checkUserUseCase.execute(const NoParams());
      _appRouter.replace(const HomeRoute());
      emit(
        state.copyWith(
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _googleSignIn(
      GoogleSignInEvent event, Emitter<LoginScreenState> emit) async {
    try {
      String userId = await _googleSignInUseCase.execute(const NoParams());
      await _saveUserUseCase.execute(userId);
      _authService.authenticated = _checkUserUseCase.execute(const NoParams());
      _appRouter.replace(const HomeRoute());
      emit(
        state.copyWith(
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
