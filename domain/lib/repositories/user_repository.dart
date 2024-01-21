import 'package:core/enums/role.dart';
import 'package:domain/models/user/user_model.dart';

abstract class UserRepository {
  Future<void> removeUserLocally();
  Future<void> saveUserLocally(UserModel model);
  Future<void> saveUserRemotely(UserModel model);
  Future<Role> fetchRoleRemotely(String uid);
  Role fetchRoleLocally();
}
