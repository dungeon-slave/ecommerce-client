import 'package:data/providers/local/hive_provider.dart';
import 'package:domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final HiveProvider _hiveProvider;

  const UserRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<void> removeUser() => _hiveProvider.removeUser();

  @override
  Future<void> saveUser(String userId) => _hiveProvider.saveUserId(userId);

  @override
  bool isUserAuthorized() => _hiveProvider.fetchUserId() != '' ? true : false;
}
