import 'package:domain/models/authentication/email_sign_in_model.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecase/usecase.dart';

class EmailSignInUseCase implements AsyncUseCase<EmailSignInModel, String> {
  final AuthenticationRepository _authenticationRepository;

  const EmailSignInUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<String> execute(EmailSignInModel input) =>
      _authenticationRepository.emailSignIn(input);
}
