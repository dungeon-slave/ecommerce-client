import 'package:core/di/app_di.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/repositories/dishes_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebase();
    _initDishes();
  }

  void _initFirebase() {
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(),
    );
  }

  void _initDishes() {
    appLocator.registerLazySingleton<DishesRepository>(
        () => DishesRepositoryImpl(appLocator.get<FirebaseProvider>()));

    appLocator.registerLazySingleton<FetchDishesUsecase>(
      () => FetchDishesUsecase(appLocator.get<DishesRepository>()),
    );
  }
}
