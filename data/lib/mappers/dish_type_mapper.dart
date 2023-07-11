import 'package:data/entities/dish_type_enity/dish_type_entity.dart';
import 'package:domain/models/dish_type_model.dart';

abstract class DishTypeMapapper {
  static DishTypeEntity toEntity(DishTypeModel model) {
    return DishTypeEntity(
      typeName: typeName, 
      dishesEntities: dishesEntities
      );
  }
}
