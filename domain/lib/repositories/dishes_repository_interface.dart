import '../models/dish_model.dart';

abstract class DishesRepository {
  Future<List<DishModel>> fetchDishes();
}
