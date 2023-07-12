import 'package:core_ui/core_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/entities/dish_entity/dish_entity.dart';
import 'package:data/entities/dish_type_enity/dish_type_entity.dart';

//??
class FirebaseProvider {
  Future<List<DishTypeEntity>> fetchDishes() async {
    List<DishTypeEntity> dishTypes = [];

    try {
      final QueryDocumentSnapshot<Map<String, dynamic>> dishesTypesDoc =
          (await FirebaseFirestore.instance
                  .collection(AppConstants.menuCollection)
                  .get())
              .docs[0];

      for (DocumentReference value in dishesTypesDoc.data().values.first) {
        final List<DishEntity> currCollection =
            (await dishesTypesDoc.reference.collection(value.id).get())
                .docs
                .map(
                  (e) => DishEntity.fromJson(e.data()),
                )
                .toList();
        dishTypes.add(
          DishTypeEntity(typeName: value.id, dishesEntities: currCollection),
        );
      }

      return dishTypes;
    } catch (e) {
      rethrow;
    }
  }
}
