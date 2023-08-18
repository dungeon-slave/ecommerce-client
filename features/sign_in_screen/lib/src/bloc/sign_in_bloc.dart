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
import 'package:sign_up_screen/sign_up_screen.gm.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<LoginScreenEvent, SignInState> {
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
        super(const SignInState()) {
    on<EmailSignInEvent>(_emailSignIn);
    on<GoogleSignInEvent>(_googleSignIn);
    on<SignUpNavigateEvent>(_signUpNavigate);
  }

  void _signUpNavigate(SignUpNavigateEvent event, Emitter<SignInState> emit) =>
      _appRouter.push(SignUpRoute());

  Future<void> _emailSignIn(
    EmailSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: '',
      ),
    );
    try {
      final String userId = await _emailSignInUseCase.execute(event.model);
      await _saveUserUseCase.execute(userId);
      _authService.authenticated = _checkUserUseCase.execute(const NoParams());
      _appRouter.replace(const HomeRoute());
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _googleSignIn(
    GoogleSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: '',
      ),
    );
    try {
      final String userId =
          await _googleSignInUseCase.execute(const NoParams());
      await _saveUserUseCase.execute(userId);
      _authService.authenticated = _checkUserUseCase.execute(const NoParams());
      _appRouter.replace(const HomeRoute());
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
