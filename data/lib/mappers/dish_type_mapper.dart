import 'package:data/entities/dish/dish_entity.dart';
import 'package:data/entities/dish_type/dish_type_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:domain/models/dishes_items/dish_model.dart';
import 'package:domain/models/dishes_items/dish_type_model.dart';

abstract class DishTypeMapper {
  static DishTypeEntity toEntity(DishTypeModel model) {
    return DishTypeEntity(
      name: model.name,
      dishes: model.dishes
          .map(
            (DishModel model) => DishMapper.toEntity(model),
          )
          .toList(),
    );
  }

  static DishTypeModel toModel(DishTypeEntity entity) {
    return DishTypeModel(
      name: entity.name,
      dishes: entity.dishes
          .map(
            (DishEntity entity) => DishMapper.toModel(entity),
          )
          .toList(),
    );
  }
}
