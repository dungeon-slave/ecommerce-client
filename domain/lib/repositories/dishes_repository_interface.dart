import '../models/dish_model.dart';

abstract class IDishesRepository {
  Future<List<DishModel>> searchDishesByType(String type);
}
