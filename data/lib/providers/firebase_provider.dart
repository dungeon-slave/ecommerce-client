import 'package:core_ui/core_ui.dart';
import 'package:data/entities/dish_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  Future<List<DishEntity>> fetchDishes() async {
    List<DishEntity> dishEntities = [];
    
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> fbMenu =
        (await FirebaseFirestore.instance
                .collection(AppConstants.MENU_COLLECTION)
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
