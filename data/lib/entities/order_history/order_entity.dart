import 'package:data/entities/cart_item/cart_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

@freezed
class OrderEntity with _$OrderEntity {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory OrderEntity({
    required String id,
    required DateTime dateTime,
    required double price,
    required List<CartItemEntity> products,
  }) = _OrderEntity;

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);
}
