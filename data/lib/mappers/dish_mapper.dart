import 'package:data/entities/dish_entity/dish_entity.dart';
import 'package:domain/models/dishes_items/dish_model.dart';

abstract class DishMapper {
  static DishEntity toEntity(DishModel model) {
    return DishEntity(
      imageRef: model.imageRef,
      name: model.name,
      price: model.price,
      description: model.description,
      ingredients: model.ingredients,
      id: model.id,
    );
  }

  static DishModel toModel(DishEntity entity) {
    return DishModel(
      imageRef: entity.imageRef,
      name: entity.name,
      price: entity.price,
      description: entity.description,
      ingredients: entity.ingredients,
      id: entity.id,
    );
  }
}
