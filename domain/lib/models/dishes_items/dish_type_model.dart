import 'package:domain/models/dishes_items/dish_model.dart';

class DishTypeModel {
  final String name;
  final List<DishModel> dishes;

  const DishTypeModel({
    required this.name,
    required this.dishes,
  });
}
