import 'package:core/core.dart';
import 'package:domain/models/dishes_items/dish_model.dart';

class CartItemModel extends Equatable {
  final DishModel dishModel;
  final int count;

  double get averagePrice => count * dishModel.price;

  const CartItemModel({
    required this.dishModel,
    required this.count,
  });

  CartItemModel copyWith({
    DishModel? model,
    int? count,
  }) {
    return CartItemModel(
        dishModel: model ?? dishModel, count: count ?? this.count);
  }

  @override
  List<Object?> get props => [count];
}
