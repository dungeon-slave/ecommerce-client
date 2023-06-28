import 'package:flutter/material.dart';
import 'package:main_menu/main_menu.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  MenuTabBar(),
    );
  }
}
