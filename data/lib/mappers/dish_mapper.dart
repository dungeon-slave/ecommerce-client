import 'package:domain/models/dish_model.dart';
import '../entities/dish_entity/dish_entity.dart';

abstract class DishMapper {
  static DishEntity toEntity(DishModel model) {
    return DishEntity(
      imageRef: model.imageRef,
      name: model.name,
      type: model.type,
      price: double.parse(model.price.substring(0, model.price.length - 1)),
      description: model.description,
      ingredients: model.ingredients,
    );
  }

  static DishModel toModel(DishEntity entity) {
    return DishModel(
      imageRef: entity.imageRef,
      name: entity.name,
      type: entity.type,
      price: '${entity.price}\$',
      description: entity.description,
      ingredients: entity.ingredients,
    );
  }
}
