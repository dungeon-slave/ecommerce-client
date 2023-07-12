import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_entity.freezed.dart';
part 'dish_entity.g.dart';

@freezed
class DishEntity with _$DishEntity {
  const factory DishEntity({
    required String imageRef,
    required String name,
    required String description,
    required double price,
    required List<String> ingredients,
  }) = _DishEntity;

  factory DishEntity.fromJson(Map<String, dynamic> json) =>
      _$DishEntityFromJson(json);
}
