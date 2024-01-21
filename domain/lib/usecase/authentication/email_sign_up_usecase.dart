import 'package:core/enums/role.dart';
import 'package:domain/models/authentication/email_sign_up_model.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecase/usecase.dart';

class EmailSignUpUseCase implements AsyncUseCase<EmailSignUpModel, void> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  const EmailSignUpUseCase({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository;

  @override
  Future<void> execute(EmailSignUpModel input) async {
    final UserModel model = UserModel(
      id: await _authenticationRepository.emailSignUp(input),
      role: Role.user,
    );
    _userRepository.saveUserRemotely(model);
    _userRepository.saveUserLocally(model);
  }
}
