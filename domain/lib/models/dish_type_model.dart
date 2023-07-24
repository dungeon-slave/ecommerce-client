import 'package:domain/models/dish_model.dart';

class DishTypeModel {
  final String typeName;
  final List<DishModel> dishesModels;

  DishTypeModel({
    required this.typeName,
    required this.dishesModels,
  });
}
