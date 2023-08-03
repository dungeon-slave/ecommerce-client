import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:navigation/src/app_router/app_router.dart';
import 'package:navigation/src/app_router/auth_guard.dart';

void setupNavigationDependencies() {
  appLocator.registerSingleton<AuthGuard>(
    AuthGuard(
      authService: appLocator<AuthService>(),
    ),
  );
  appLocator.registerSingleton<AppRouter>(
    AppRouter(
      authGuard: appLocator<AuthGuard>(),
    ),
  );
}
