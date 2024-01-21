import 'package:core/enums/role.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecase/usecase.dart';

class CheckUserRoleUseCase implements UseCase<NoParams, Role> {
  final UserRepository _userRepository;

  const CheckUserRoleUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Role execute(NoParams input) => _userRepository.fetchRoleLocally();
}
