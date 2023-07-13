// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DishEntity _$DishEntityFromJson(Map<String, dynamic> json) {
  return _DishEntity.fromJson(json);
}

/// @nodoc
mixin _$DishEntity {
  String get imageRef => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishEntityCopyWith<DishEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishEntityCopyWith<$Res> {
  factory $DishEntityCopyWith(
          DishEntity value, $Res Function(DishEntity) then) =
      _$DishEntityCopyWithImpl<$Res, DishEntity>;
  @useResult
  $Res call({String imageRef, String name, String type, double price});
}

/// @nodoc
class _$DishEntityCopyWithImpl<$Res, $Val extends DishEntity>
    implements $DishEntityCopyWith<$Res> {
  _$DishEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageRef = null,
    Object? name = null,
    Object? type = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      imageRef: null == imageRef
          ? _value.imageRef
          : imageRef // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DishEntityCopyWith<$Res>
    implements $DishEntityCopyWith<$Res> {
  factory _$$_DishEntityCopyWith(
          _$_DishEntity value, $Res Function(_$_DishEntity) then) =
      __$$_DishEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageRef, String name, String type, double price});
}

/// @nodoc
class __$$_DishEntityCopyWithImpl<$Res>
    extends _$DishEntityCopyWithImpl<$Res, _$_DishEntity>
    implements _$$_DishEntityCopyWith<$Res> {
  __$$_DishEntityCopyWithImpl(
      _$_DishEntity _value, $Res Function(_$_DishEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageRef = null,
    Object? name = null,
    Object? type = null,
    Object? price = null,
  }) {
    return _then(_$_DishEntity(
      imageRef: null == imageRef
          ? _value.imageRef
          : imageRef // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DishEntity implements _DishEntity {
  const _$_DishEntity(
      {required this.imageRef,
      required this.name,
      required this.type,
      required this.price});

  factory _$_DishEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DishEntityFromJson(json);

  @override
  final String imageRef;
  @override
  final String name;
  @override
  final String type;
  @override
  final double price;

  @override
  String toString() {
    return 'DishEntity(imageRef: $imageRef, name: $name, type: $type, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DishEntity &&
            (identical(other.imageRef, imageRef) ||
                other.imageRef == imageRef) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageRef, name, type, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DishEntityCopyWith<_$_DishEntity> get copyWith =>
      __$$_DishEntityCopyWithImpl<_$_DishEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DishEntityToJson(
      this,
    );
  }
}

abstract class _DishEntity implements DishEntity {
  const factory _DishEntity(
      {required final String imageRef,
      required final String name,
      required final String type,
      required final double price}) = _$_DishEntity;

  factory _DishEntity.fromJson(Map<String, dynamic> json) =
      _$_DishEntity.fromJson;

  @override
  String get imageRef;
  @override
  String get name;
  @override
  String get type;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_DishEntityCopyWith<_$_DishEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
