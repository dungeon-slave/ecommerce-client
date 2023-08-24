import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecase/usecase.dart';

class CheckUserUseCase implements UseCase<NoParams, bool> {
  final UserRepository _userRepository;

  const CheckUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  bool execute(NoParams input) => _userRepository.isUserAuthorized();
}
