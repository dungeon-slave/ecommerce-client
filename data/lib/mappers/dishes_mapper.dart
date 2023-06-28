import 'package:data/entities/dish_entity.dart';
import 'package:domain/models/dish_model.dart';

abstract class DishesMapper {
  static DishEntity toEntity(DishModel model) {
    return DishEntity(
      model.imageRef, 
      model.name, 
      model.type, 
      double.parse(model.price.substring(0, model.price.length - 1)));
  }

  static DishModel toModel(DishEntity entity) {
    return DishModel(
      entity.imageRef,
      entity.name,
      entity.type,
      '${entity.price}\$'
    );
  }
}
