import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SaveUserUseCase implements AsyncUseCase<String, void> {
  final UserRepository _userRepository;

  const SaveUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(String input) => _userRepository.saveUser(input);
}
