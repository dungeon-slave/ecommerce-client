import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_screen/sign_in_screen.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthService _authService;

  AuthGuard({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authService.authenticated) {
      resolver.next();
    } else {
      router.pushAndPopUntil(SignInRoute(),
          predicate: (Route<dynamic> predicate) => false);
    }
  }
}
