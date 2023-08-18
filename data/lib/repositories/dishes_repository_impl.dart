import 'package:core/safe_request.dart';
import 'package:data/entities/dish_type_enity/dish_type_entity.dart';
import 'package:data/mappers/dish_type_mapper.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:domain/models/dishes_items/dish_type_model.dart';
import 'package:domain/repositories/dishes_repository.dart';

class DishesRepositoryImpl implements DishesRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;

  const DishesRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<DishTypeModel>> fetchMenu() async {
    List<DishTypeEntity> result;

    try {
      result = await safeRequest<List<DishTypeEntity>>(
        () => _firebaseProvider.fetchMenu(),
      );
      _hiveProvider.saveMenu(result);
    } catch (e) {
      result = _hiveProvider.fetchMenu();
    }

    return result
        .map(
          (DishTypeEntity e) => DishTypeMapper.toModel(e),
        )
        .toList();
  }
}
