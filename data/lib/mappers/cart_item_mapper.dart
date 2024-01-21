import 'package:data/entities/cart_item/cart_item_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';

abstract class CartItemMapper {
  static CartItemEntity toEntity(CartItemModel model) {
    return CartItemEntity(
      dishEntity: DishMapper.toEntity(model.dishModel),
      count: model.count,
    );
  }

  static CartItemModel toModel(CartItemEntity entity) {
    return CartItemModel(
      dishModel: DishMapper.toModel(entity.dishEntity),
      count: entity.count,
    );
  }
}
