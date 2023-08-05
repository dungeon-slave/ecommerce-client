import 'package:data/entities/dish_entity/dish_entity.dart';
import 'package:data/entities/dish_type_enity/dish_type_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:domain/models/dishes_items/dish_model.dart';
import 'package:domain/models/dishes_items/dish_type_model.dart';

abstract class DishTypeMapper {
  static DishTypeEntity toEntity(DishTypeModel model) {
    return DishTypeEntity(
      typeName: model.typeName,
      dishesEntities: model.dishesModels
          .map(
            (DishModel model) => DishMapper.toEntity(model),
          )
          .toList(),
    );
  }

  static DishTypeModel toModel(DishTypeEntity entity) {
    return DishTypeModel(
      typeName: entity.typeName,
      dishesModels: entity.dishesEntities
          .map(
            (DishEntity entity) => DishMapper.toModel(entity),
          )
          .toList(),
    );
  }
}
