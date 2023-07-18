import 'package:domain/models/dish_model.dart';
import '../entities/dish_entity/dish_entity.dart';

abstract class DishMapper {
  static DishEntity toEntity(DishModel model) {
    return DishEntity(
      imageRef: model.imageRef,
      name: model.name,
      price: model.price,
      description: model.description,
      ingredients: model.ingredients,
    );
  }

  static DishModel toModel(DishEntity entity) {
    return DishModel(
      imageRef: entity.imageRef,
      name: entity.name,
      price: entity.price,
      description: entity.description,
      ingredients: entity.ingredients,
    );
  }
}
