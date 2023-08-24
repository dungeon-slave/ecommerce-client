import 'package:core/core.dart' show Equatable;
import 'package:domain/models/dishes_items/dish_model.dart';


class CartItemModel extends Equatable {
  final DishModel dishModel;
  int _count;

  int get count => _count;

  void incrementCount() => _count++;

  void decrementCount() => _count--;

  double get averagePrice => _count * dishModel.price;

  CartItemModel({
    required this.dishModel,
    required int count,
  }) : _count = count;

  CartItemModel copyWith({
    DishModel? model,
    int? count,
  }) {
    return CartItemModel(
      dishModel: model ?? dishModel,
      count: count ?? _count,
    );
  }

  @override
  List<Object?> get props => [_count];
}
