import '../entities/dish_entity/dish_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/models/dish_model.dart';
import 'package:domain/repositories/dishes_repository_interface.dart';

class DishesRepositoryImpl implements DishesRepository {
  final FirebaseProvider _firebaseProvider;

  DishesRepositoryImpl(this._firebaseProvider);

  @override
  Future<List<DishModel>> fetchDishes() async {
    final List<DishEntity> result = await _firebaseProvider.fetchDishes();

    return result.map((DishEntity e) => DishMapper.toModel(e)).toList();
  }
}
