import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../dish_entity/dish_entity.dart';

part 'dish_type_entity.freezed.dart';
part 'dish_type_entity.g.dart';

@freezed
@HiveType(typeId: 2)
class DishTypeEntity with _$DishTypeEntity {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory DishTypeEntity({
    @HiveField(0) required String name,
    @HiveField(1) required List<DishEntity> dishes,
  }) = _DishTypeEntity;

    factory DishTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$DishTypeEntityFromJson(json);
}
