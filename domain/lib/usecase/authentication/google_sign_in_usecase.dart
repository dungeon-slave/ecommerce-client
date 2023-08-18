import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecase/usecase.dart';

class GoogleSignInUseCase implements AsyncUseCase<NoParams, String> {
  final AuthenticationRepository _authenticationRepository;

  const GoogleSignInUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<String> execute(NoParams input) =>
      _authenticationRepository.googleSignIn();
}
