import 'package:core/core.dart';
import 'package:data/entities/dish_entity/dish_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  @HiveType(typeId: 0)
  const factory CartItemEntity({
    @HiveField(0) required DishEntity dishEntity,
    @HiveField(1) required int count, 
  }) = _CartItemEntity;
}
