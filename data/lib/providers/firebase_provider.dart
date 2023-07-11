import 'package:core_ui/core_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/dish_entity/dish_entity.dart';

class FirebaseProvider {
  Future<List<DishEntity>> fetchDishes() async {
    List<DishEntity> dishEntities = [];

    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> fbMenu =
          (await FirebaseFirestore.instance
                  .collection(AppConstants.menuCollection)
                  .get())
              .docs
              .toList();

      for (QueryDocumentSnapshot<Map<String, dynamic>> fbDish in fbMenu) {
        dishEntities.add(DishEntity.fromJson(fbDish.data()));
      }

      return dishEntities;
    } catch (e) {
      rethrow;
    }
  }
}
