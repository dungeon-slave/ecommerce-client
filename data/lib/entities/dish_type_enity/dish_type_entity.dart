import 'package:freezed_annotation/freezed_annotation.dart';
import '../dish_entity/dish_entity.dart';

part 'dish_type_entity.freezed.dart';

@freezed
class DishTypeEntity with _$DishTypeEntity {
  const factory DishTypeEntity({
    required String typeName,
    required List<DishEntity> dishesEntities,
  }) = _DishTypeEntity;
}
