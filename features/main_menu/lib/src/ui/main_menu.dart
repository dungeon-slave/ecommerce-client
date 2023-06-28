import 'package:domain/models/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/src/ui/dish_item.dart';

class MainMenu extends StatefulWidget {
  final List<DishModel> _dishesModels;

  const MainMenu(this._dishesModels, {super.key});

  @override
  State<StatefulWidget> createState() => MainMenuState();
} 

class MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 31, 36),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: List.generate(
          widget._dishesModels.length,
          (index) => DishItem(
            widget._dishesModels[index].name,
            widget._dishesModels[index].imageRef,
            widget._dishesModels[index].price,
          ),
        ),
      ),
    );
  }
}
