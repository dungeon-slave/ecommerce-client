import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecase/usecase.dart';

class GoogleSignInUseCase implements AsyncUseCase<NoParams, void> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  const GoogleSignInUseCase({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository;

  @override
  Future<void> execute(NoParams input) async {
    final String uid = await _authenticationRepository.googleSignIn();
    final UserModel model = UserModel(
      id: uid,
      role: await _userRepository.fetchRoleRemotely(uid),
    );
    _userRepository.saveUserLocally(model);
  }
}
