import 'package:core/enums/role.dart';
import 'package:data/mappers/user_mapper.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final HiveProvider _hiveProvider;
  final FirebaseProvider _firebaseProvider;

  const UserRepositoryImpl({
    required HiveProvider hiveProvider,
    required FirebaseProvider firebaseProvider,
  })  : _hiveProvider = hiveProvider,
        _firebaseProvider = firebaseProvider;

  @override
  Future<void> removeUserLocally() => _hiveProvider.removeUser();

  @override
  Future<void> saveUserRemotely(UserModel model) =>
      _firebaseProvider.createUser(UserMapper.toEntity(model));

  @override
  Future<void> saveUserLocally(UserModel model) =>
      _hiveProvider.saveUser(UserMapper.toEntity(model));

  @override
  Role fetchRoleLocally() => _hiveProvider.fetchUserRole();

  @override
  Future<Role> fetchRoleRemotely(String uid) =>
      _firebaseProvider.fetchRole(uid);
}
