import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_entity.freezed.dart';
part 'dish_entity.g.dart';

@freezed
@HiveType(typeId: 1)
class DishEntity with _$DishEntity {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
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
