import 'package:data/entities/dish_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {

  late final List<DishEntity> dishEntities = [];

  Future<List<DishEntity>> fetchDishes(String typeFilter) async {

    if (dishEntities.isEmpty) {
      await _getDishes();
    }

    List<DishEntity> filteredDishes = [];

    for (var dish in dishEntities) {
      if (dish.type == typeFilter) {
        filteredDishes.add(dish);
      }
    }

    return filteredDishes;
  }

  Future<void> _getDishes() async {

    final fbMenu = (await FirebaseFirestore
                      .instance
                      .collection('menu')
                      .get())
                      .docs
                      .toList();

    for (var fbDish in fbMenu) {
      dishEntities.add(DishEntity(
        fbDish['image'] as String,
        fbDish['name'] as String, 
        fbDish['type'] as String, 
        fbDish['price'] as double
      ));
    }

    return;
  }
}
