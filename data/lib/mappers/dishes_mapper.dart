import 'package:data/entities/dish_entity.dart';
import 'package:domain/models/dish_model.dart';

abstract class DishesMapper {
  static DishEntity toEntity(DishModel model) {
    return DishEntity(
        imageRef: model.imageRef,
        name: model.name,
        type: model.type,
        price: double.parse(model.price.substring(0, model.price.length - 1)));
  }

  static DishModel toModel(DishEntity entity) {
    return DishModel(
        imageRef: entity.imageRef,
        name: entity.name,
        type: entity.type,
        price: '${entity.price}\$');
  }
}
