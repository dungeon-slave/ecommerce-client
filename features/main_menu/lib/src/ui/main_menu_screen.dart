import 'package:flutter/material.dart';
import 'package:main_menu/src/ui/dish_element.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 31, 36),
      body: Column(
        children: [
          DishElement(name: 'Dish 1'),
          DishElement(name: 'Dish 2'),
          DishElement(name: 'Dish 3'),
          DishElement(name: 'Dish 4'),
          DishElement(name: 'Dish 5'),
        ],
      ),
    );
  }
}
