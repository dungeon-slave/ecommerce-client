import 'package:core/di/app_di.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appLocator<AppRouter>().delegate(),
      routeInformationParser: appLocator<AppRouter>().defaultRouteParser(),
    );
  }
}
