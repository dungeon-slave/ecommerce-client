import 'package:data/entities/user/user_entity.dart';
import 'package:domain/domain.dart' show UserModel;

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      role: model.role,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      role: entity.role,
    );
  }
}
