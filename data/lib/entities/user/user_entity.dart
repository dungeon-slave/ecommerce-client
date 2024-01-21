import 'package:core/core.dart';
import 'package:core/enums/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
@HiveType(typeId: 3)
class UserEntity with _$UserEntity {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory UserEntity({
    @HiveField(0) required String id,
    @HiveField(1) required Role role,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
