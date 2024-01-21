import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core/enums/role.dart';
import 'package:core/services/network_service.dart';
import 'package:data/entities/cart_item/cart_item_entity.dart';
import 'package:data/entities/dish/dish_entity.dart';
import 'package:data/entities/dish_type/dish_type_entity.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/remote/firebase_auth_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:data/repositories/authentication_repository_impl.dart';
import 'package:data/repositories/cart_repository_impl.dart';
import 'package:data/repositories/dishes_repository_impl.dart';
import 'package:data/repositories/order_history_repository_impl.dart';
import 'package:data/repositories/text_scale_repository.dart';
import 'package:data/repositories/theme_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecase/order_history/fetch_order_history.dart';
import 'package:domain/usecase/shopping_cart/send_order_usecase.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initServices();
    _initProviders();
    _initAdapters();
    _initRepositories();
    _initUseCases();
  }

  void _initServices() {
    appLocator.registerLazySingleton<UrlService>(
      () => UrlService(),
    );
    appLocator.registerLazySingleton<AuthService>(
      () => AuthService(),
    );
    appLocator.registerLazySingleton<NetworkService>(
      () => NetworkService(
        connectivity: Connectivity(),
        internetConnectionChecker: InternetConnectionChecker(),
      ),
    );
  }

  void _initProviders() {
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(),
    );

    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(),
    );

    appLocator.registerLazySingleton<FirebaseAuthProvider>(
      () => FirebaseAuthProvider(
        firebaseAuth: FirebaseAuth.instance,
        googleSignIn: GoogleSignIn(),
      ),
    );
  }

  void _initAdapters() {
    Hive.registerAdapter<CartItemEntity>(
      CartItemEntityAdapter(),
    );
    Hive.registerAdapter<DishEntity>(
      DishEntityAdapter(),
    );
    Hive.registerAdapter<DishTypeEntity>(
      DishTypeEntityAdapter(),
    );
    Hive.registerAdapter<UserEntity>(
      UserEntityAdapter(),
    );
    Hive.registerAdapter<Role>(
      RoleAdapter(),
    );
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        hiveProvider: appLocator<HiveProvider>(),
        firebaseProvider: appLocator<FirebaseProvider>(),
      ),
    );

    appLocator.registerLazySingleton<OrderHistoryRepository>(
      () => OrderHistoryRepositoryImpl(
        firebaseProvider: appLocator<FirebaseProvider>(),
        hiveProvider: appLocator<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        firebaseProvider: appLocator<FirebaseProvider>(),
        hiveProvider: appLocator<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(
        hiveProvider: appLocator<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<TextScaleRepository>(
      () => TextScaleRepositoryImpl(
        hiveProvider: appLocator<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        hiveProvider: appLocator<HiveProvider>(),
        firebaseProvider: appLocator<FirebaseProvider>(),
      ),
    );

    appLocator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        authProvider: appLocator<FirebaseAuthProvider>(),
      ),
    );
  }

  void _initUseCases() {
    appLocator.registerLazySingleton<FetchOrderHistoryUseCase>(
      () => FetchOrderHistoryUseCase(
        orderHistoryRepository: appLocator<OrderHistoryRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SendOrderUseCase>(
      () => SendOrderUseCase(
        cartRepository: appLocator<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<FetchDishesUsecase>(
      () => FetchDishesUsecase(
        dishesRepository: appLocator<DishesRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SetThemeUseCase>(
      () => SetThemeUseCase(
        themeRepository: appLocator<ThemeRepository>(),
      ),
    );

    appLocator.registerLazySingleton<FetchThemeUseCase>(
      () => FetchThemeUseCase(
        themeRepository: appLocator<ThemeRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SetTextScaleUseCase>(
      () => SetTextScaleUseCase(
        textScaleRepository: appLocator<TextScaleRepository>(),
      ),
    );

    appLocator.registerLazySingleton<FetchTextScaleUseCase>(
      () => FetchTextScaleUseCase(
        textScaleRepository: appLocator<TextScaleRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SaveItemUseCase>(
      () => SaveItemUseCase(
        cartRepository: appLocator<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchItemsUseCase>(
      () => FetchItemsUseCase(
        cartRepository: appLocator<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<ClearCartUseCase>(
      () => ClearCartUseCase(
        cartRepository: appLocator<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<ChangeItemCountUseCase>(
      () => ChangeItemCountUseCase(
        cartRepository: appLocator<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<EmailSignInUseCase>(
      () => EmailSignInUseCase(
        authenticationRepository: appLocator<AuthenticationRepository>(),
        userRepository: appLocator<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton<EmailSignUpUseCase>(
      () => EmailSignUpUseCase(
        authenticationRepository: appLocator<AuthenticationRepository>(),
        userRepository: appLocator<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(
        authenticationRepository: appLocator<AuthenticationRepository>(),
        userRepository: appLocator<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        userRepository: appLocator<UserRepository>(),
        authenticationRepository: appLocator<AuthenticationRepository>(),
      ),
    );

    appLocator.registerLazySingleton<FetchCartCountUseCase>(
      () => FetchCartCountUseCase(
        cartRepository: appLocator<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<CheckUserRoleUseCase>(
      () => CheckUserRoleUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );
  }
}
