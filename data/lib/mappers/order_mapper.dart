import 'package:data/entities/cart_item/cart_item_entity.dart';
import 'package:data/entities/order_history/order_entity.dart';
import 'package:data/mappers/cart_item_mapper.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:domain/models/order_history/order_model.dart';

abstract class OrderMapper {
  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.id,
      dateTime: model.dateTime,
      price: model.price,
      products: model.products
          .map(
            (CartItemModel model) => CartItemMapper.toEntity(model),
          )
          .toList(),
    );
  }

  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      id: entity.id.hashCode.toString(),
      dateTime: entity.dateTime,
      price: entity.price,
      products: entity.products
          .map(
            (CartItemEntity entity) => CartItemMapper.toModel(entity),
          )
          .toList(),
    );
  }
}
