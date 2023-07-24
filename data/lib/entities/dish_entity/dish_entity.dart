import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_entity.freezed.dart';
part 'dish_entity.g.dart';

@freezed
class DishEntity with _$DishEntity {
  @HiveType(typeId: 1)
  const factory DishEntity({
    @HiveField(0) required String imageRef,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required double price,
    @HiveField(4) required List<String> ingredients,
    @HiveField(5) required String id,
  }) = _DishEntity;

  factory DishEntity.fromJson(Map<String, dynamic> json) =>
      _$DishEntityFromJson(json);
}
