// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DishEntity _$$_DishEntityFromJson(Map<String, dynamic> json) =>
    _$_DishEntity(
      imageRef: json['image'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      price: json['price'] as double,
    );

Map<String, dynamic> _$$_DishEntityToJson(_$_DishEntity instance) =>
    <String, dynamic>{
      'imageRef': instance.imageRef,
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
    };
