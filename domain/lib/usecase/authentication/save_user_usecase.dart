import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SaveUserUseCase implements AsyncUseCase<String, void> {
  final AuthenticationRepository _authenticationRepository;

  const SaveUserUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<void> execute(String input) async =>
      await _authenticationRepository.saveUser(input);
}
