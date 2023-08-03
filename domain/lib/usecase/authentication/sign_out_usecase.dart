import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SignOutUseCase implements AsyncUseCase<NoParams, void> {
  final AuthenticationRepository _authenticationRepository;

  const SignOutUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<void> execute(NoParams input) async =>
      await _authenticationRepository.signOut();
}
