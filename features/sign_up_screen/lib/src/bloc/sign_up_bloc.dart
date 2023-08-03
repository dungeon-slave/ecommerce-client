import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final EmailSignUpUseCase _emailSignUpUseCase;
  final SaveUserUseCase _saveUserUseCase;

  SignUpBloc({
    required EmailSignUpUseCase emailSignUpUseCase,
    required SaveUserUseCase saveUserUseCase,
  })  : _emailSignUpUseCase = emailSignUpUseCase,
        _saveUserUseCase = saveUserUseCase,
        super(SignUpState()) {
    on<SignUpEvent>(_emailSignUp);
  }

  Future<void> _emailSignUp(
      SignUpEvent event, Emitter<SignUpState> emit) async {
    String userId = await _emailSignUpUseCase.execute(event.data);
    await _saveUserUseCase.execute(userId);
    //TODO implement state change
  }
}
