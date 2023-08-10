import 'package:domain/models/dishes_items/dish_type_model.dart';

abstract class DishesRepository {
  Future<List<DishTypeModel>> getMenu();
  Future<void> saveMenu(List<DishTypeModel> menu);
}
