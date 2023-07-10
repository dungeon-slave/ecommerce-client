import 'package:core_ui/core_ui.dart';
import 'package:domain/models/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/src/ui/dish_item.dart';

class MenuList extends StatefulWidget {
  final List<DishModel> _dishesModels;

  const MenuList(this._dishesModels, {super.key});

  @override
  State<StatefulWidget> createState() => MenuListState();
}

class MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.DART_BREEZE,
      body: ListView(
        padding: const EdgeInsets.all(AppDimens.PADDING_10),
        children: List.generate(
          widget._dishesModels.length,
          (index) => DishItem(
            name: widget._dishesModels[index].name,
            imageRef: widget._dishesModels[index].imageRef,
            price: widget._dishesModels[index].price,
          ),
        ),
      ),
    );
  }
}