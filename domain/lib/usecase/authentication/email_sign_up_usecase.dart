import 'package:domain/models/authentication/email_sign_up_model.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecase/usecase.dart';

class EmailSignUpUseCase implements AsyncUseCase<EmailSignUpModel, String> {
  final AuthenticationRepository _authenticationRepository;

  const EmailSignUpUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<String> execute(EmailSignUpModel input) async =>
      await _authenticationRepository.emailSignUp(input);
}
