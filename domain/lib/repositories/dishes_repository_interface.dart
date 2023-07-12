import 'package:domain/models/dish_type_model.dart';

abstract class DishesRepository {
  Future<List<DishTypeModel>> fetchDishes();
}
