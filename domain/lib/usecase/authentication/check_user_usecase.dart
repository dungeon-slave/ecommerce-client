import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecase/usecase.dart';

class CheckUserUseCase implements UseCase<NoParams, bool> {
  final AuthenticationRepository _authenticationRepository;

  const CheckUserUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  bool execute(NoParams input) => _authenticationRepository.checkUser();
}
