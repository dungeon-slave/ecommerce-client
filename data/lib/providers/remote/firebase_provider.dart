import 'package:core/core.dart' show FirebaseFirestore, QueryDocumentSnapshot;
import 'package:core_ui/core_ui.dart' show AppConstants;
import 'package:data/entities/dish_entity/dish_entity.dart';
import 'package:data/entities/dish_type_enity/dish_type_entity.dart';

class FirebaseProvider {
  Future<List<DishTypeEntity>> fetchMenu() async {
    List<DishTypeEntity> dishesTypes = <DishTypeEntity>[];

    final QueryDocumentSnapshot<Map<String, dynamic>> dishesTypesDoc =
        (await FirebaseFirestore.instance
                .collection(AppConstants.menuCollection)
                .get())
            .docs
            .first;

    Map<String, dynamic> fbDishesTypes = dishesTypesDoc.data();

    for (String key in fbDishesTypes.keys) {
      final List<DishEntity> dishes = <DishEntity>[];
      for (Map<String, dynamic> dish in fbDishesTypes[key]) {
        dishes.add(DishEntity.fromJson(dish));
      }
      dishesTypes.add(
        DishTypeEntity(typeName: key, dishesEntities: dishes),
      );
    }

    return dishesTypes;
  }
}
