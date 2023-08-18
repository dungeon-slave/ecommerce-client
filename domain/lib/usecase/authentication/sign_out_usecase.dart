import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SignOutUseCase implements AsyncUseCase<NoParams, void> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  const SignOutUseCase({
    required UserRepository userRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository;

  @override
  Future<void> execute(NoParams input) async {
    await _authenticationRepository.signOut();
    await _userRepository.removeUser();
  }
}
