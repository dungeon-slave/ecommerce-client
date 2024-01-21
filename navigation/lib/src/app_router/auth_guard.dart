import 'package:admin_home/admin_home_screen.gm.dart';
import 'package:core/core.dart';
import 'package:core/enums/role.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_screen/sign_in_screen.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthService _authService;

  AuthGuard({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    switch (_authService.role) {
      case Role.user:
        {
          resolver.next();
          break;
        }
      case Role.admin:
        {
          router.pushAndPopUntil(
            const AdminHomeRoute(),
            predicate: (Route<dynamic> predicate) => false,
          );
          break;
        }
      case Role.undefined:
        {
          router.pushAndPopUntil(
            const EmptySign(),
            predicate: (Route<dynamic> predicate) => false,
          );
          break;
        }
      default:
        {
          throw Exception(AppStrConstants.nonExistentRole);
        }
    }
  }
}
