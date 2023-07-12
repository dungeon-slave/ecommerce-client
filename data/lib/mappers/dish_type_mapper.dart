import 'package:data/entities/dish_type_enity/dish_type_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:domain/models/dish_model.dart';
import 'package:domain/models/dish_type_model.dart';
import '../entities/dish_entity/dish_entity.dart';

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
