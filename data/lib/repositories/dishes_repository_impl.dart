import 'package:data/entities/dish_entity.dart';
import 'package:data/mappers/dishes_mapper.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/models/dish_model.dart';
import 'package:domain/repositories/dishes_repository_interface.dart';

class DishesRepository implements IDishesRepository {

  final FirebaseProvider _firebaseProvider;

  DishesRepository(this._firebaseProvider); 

  @override
  Future<List<DishModel>> searchDishesByType(String type) async {
    final List<DishEntity> result = await _firebaseProvider.fetchDishes(type);
  
    return result.map((DishEntity e) => DishesMapper.toModel(e)).toList();
  }
}
