import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../dish_entity/dish_entity.dart';

part 'dish_type_entity.freezed.dart';
part 'dish_type_entity.g.dart';

@freezed
class DishTypeEntity with _$DishTypeEntity {
  @HiveType(typeId: 2)
  const factory DishTypeEntity({
    @HiveField(0) required String typeName,
    @HiveField(1) required List<DishEntity> dishesEntities,
  }) = _DishTypeEntity;
}
