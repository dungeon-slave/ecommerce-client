import 'package:core/di/app_di.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/hive_provider.dart';
import 'package:data/repositories/dishes/dishes_repository_impl.dart';
import 'package:data/repositories/theme/theme_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebase();
    _initDishes();
    _initHive();
    _initTheme();
  }

  void _initFirebase() {
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(),
    );
  }

  void _initDishes() {
    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(appLocator.get<FirebaseProvider>()),
    );

    appLocator.registerLazySingleton<FetchDishesUsecase>(
      () => FetchDishesUsecase(appLocator.get<DishesRepository>()),
    );
  }

  void _initHive() {
    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(),
    );
  }

  void _initTheme() {
    appLocator.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(hiveProvider: appLocator<HiveProvider>()),
    );

    appLocator.registerLazySingleton<SetThemeUseCase>(
      () => SetThemeUseCase(themeRepository: appLocator.get<ThemeRepository>()),
    );

    appLocator.registerLazySingleton<GetThemeUseCase>(
      () => GetThemeUseCase(themeRepository: appLocator.get<ThemeRepository>()),
    );
  }
}
