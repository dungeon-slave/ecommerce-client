import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:data/entities/cart_item_entity/cart_item_entity.dart';
import 'package:data/entities/dish_entity/dish_entity.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/repositories/cart/cart_repository_impl.dart';
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
    _initCart();
    _initHomeScreen();
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
    appLocator.registerLazySingleton<HiveProvider>(() => HiveProvider());
    Hive.registerAdapter<CartItemEntity>(CartItemEntityAdapter());
    Hive.registerAdapter<DishEntity>(DishEntityAdapter());
  }

  void _initTheme() {
    appLocator.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(hiveProvider: appLocator<HiveProvider>()),
    );

    appLocator.registerLazySingleton<SetThemeUseCase>(
      () => SetThemeUseCase(themeRepository: appLocator<ThemeRepository>()),
    );

    appLocator.registerLazySingleton<GetThemeUseCase>(
      () => GetThemeUseCase(themeRepository: appLocator<ThemeRepository>()),
    );
  }

  void _initCart() {
    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(hiveProvider: appLocator<HiveProvider>()),
    );

    appLocator.registerLazySingleton<SaveItemUseCase>(
      () => SaveItemUseCase(
        cartRepository: appLocator<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<GetItemsUseCase>(
      () => GetItemsUseCase(cartRepository: appLocator<CartRepository>()),
    );
    appLocator.registerLazySingleton<ClearCartUseCase>(
      () => ClearCartUseCase(cartRepository: appLocator<CartRepository>()),
    );
    appLocator.registerLazySingleton<ChangeItemCountUseCase>(
      () => ChangeItemCountUseCase(cartRepository: appLocator<CartRepository>()),
    );
  }

  void _initHomeScreen() {
    appLocator.registerLazySingleton<GetCartCountUseCase>(
      () => GetCartCountUseCase(cartRepository: appLocator<CartRepository>()),
    );
  }
}
