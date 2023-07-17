import 'package:data/entities/dish_type_enity/dish_type_entity.dart';
import 'package:domain/models/dish_type_model.dart';
import 'package:data/mappers/dish_type_mapper.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/repositories/dishes_repository_interface.dart';

class DishesRepositoryImpl implements DishesRepository {
  final FirebaseProvider _firebaseProvider;

  DishesRepositoryImpl(this._firebaseProvider);

  @override
  Future<List<DishTypeModel>> fetchDishes() async {
    final List<DishTypeEntity> result = await _firebaseProvider.fetchDishes();

    return result.map((DishTypeEntity e) => DishTypeMapper.toModel(e)).toList();
  }
}
