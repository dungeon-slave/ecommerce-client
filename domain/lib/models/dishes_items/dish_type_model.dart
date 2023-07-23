import 'package:domain/models/dishes_items/dish_model.dart';

class DishTypeModel {
  final String typeName;
  final List<DishModel> dishesModels;

  const DishTypeModel({
    required this.typeName,
    required this.dishesModels,
  });
}
