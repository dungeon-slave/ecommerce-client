import 'package:core/core.dart';
import 'package:data/entities/dish/dish_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

@freezed
@HiveType(typeId: 0)
class CartItemEntity with _$CartItemEntity {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory CartItemEntity({
    @HiveField(0) required DishEntity dishEntity,
    @HiveField(1) required int count,
  }) = _CartItemEntity;

  factory CartItemEntity.fromJson(Map<String, dynamic> json) =>
      _$CartItemEntityFromJson(json);
}
