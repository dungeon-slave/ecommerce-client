import 'package:core/core.dart' show Bloc, Emitter;
import 'package:core/services/auth_service.dart';
import 'package:domain/models/authentication/email_sign_in_model.dart';
import 'package:domain/usecase/authentication/check_user_role_usecase.dart';
import 'package:domain/usecase/authentication/email_sign_in_usecase.dart';
import 'package:domain/usecase/authentication/google_sign_in_usecase.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:home_screen/home_screen.gm.dart';
import 'package:navigation/navigation.dart';
import 'package:sign_up_screen/sign_up_screen.gm.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<LoginScreenEvent, SignInState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final EmailSignInUseCase _emailSignInUseCase;
  final CheckUserRoleUseCase _checkUserUseCase;
  final AuthService _authService;
  final AppRouter _appRouter;

  SignInBloc({
    required GoogleSignInUseCase googleSignInUseCase,
    required EmailSignInUseCase emailSignInUseCase,
    required CheckUserRoleUseCase checkUserUseCase,
    required AuthService authService,
    required AppRouter appRouter,
  })  : _googleSignInUseCase = googleSignInUseCase,
        _emailSignInUseCase = emailSignInUseCase,
        _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        _appRouter = appRouter,
        super(const SignInState()) {
    on<EmailSignInEvent>(_emailSignIn);
    on<GoogleSignInEvent>(_googleSignIn);
    on<SignUpNavigateEvent>(_signUpNavigate);
  }

  void _signUpNavigate(_, __) => _appRouter.push(const SignUpRoute());

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
      await _emailSignInUseCase.execute(event.model);
      _authService.role = _checkUserUseCase.execute(const NoParams());
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

  Future<void> _googleSignIn(_, Emitter<SignInState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: '',
      ),
    );

    try {
      await _googleSignInUseCase.execute(const NoParams());
      _authService.role = _checkUserUseCase.execute(const NoParams());
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
