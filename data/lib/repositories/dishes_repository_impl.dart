import 'package:core/services/network_service.dart';
import 'package:data/entities/dish_type_enity/dish_type_entity.dart';
import 'package:data/mappers/dish_type_mapper.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:domain/models/dishes_items/dish_type_model.dart';
import 'package:domain/repositories/dishes_repository.dart';

class DishesRepositoryImpl implements DishesRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;
  final NetworkService _networkService;

  const DishesRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
    required NetworkService networkService,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider,
        _networkService = networkService;

  @override
  Future<List<DishTypeModel>> fetchMenu() async {
    final bool connectivityResult = 
        await _networkService.checkConnection();
    final List<DishTypeEntity> result = connectivityResult
        ? await _firebaseProvider.fetchMenu()
        : _hiveProvider.fetchMenu();

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
