import 'package:core/core.dart';
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
  Future<List<DishTypeModel>> getMenu() async {
    final bool connectivityResult =
        await InternetConnectionChecker().hasConnection;
    final List<DishTypeEntity> result = connectivityResult
        ? await _firebaseProvider.getMenu()
        : _hiveProvider.getMenu();

    return result
        .map(
          (DishTypeEntity e) => DishTypeMapper.toModel(e),
        )
        .toList();
  }

  @override
  Future<void> saveMenu(List<DishTypeModel> menu) async {
    _hiveProvider.saveMenu(
      menu
          .map(
            (DishTypeModel e) => DishTypeMapper.toEntity(e),
          )
          .toList(),
    );
  }
}
