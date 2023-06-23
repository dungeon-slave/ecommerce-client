import 'package:flutter/material.dart';
import 'package:main_menu/src/ui/dish_item.dart';

class MainMenuScreen extends StatefulWidget { 
  static MainMenuScreen? _cachedMenu;
  static late List<DishItem> currentDishes;
  static final List<DishItem> _dishes = [
      DishItem(
        name: 'Гамбургер', 
        image: const NetworkImage('https://avatanplus.com/files/resources/original/5c79e463c15f81693c2425d0.png'),
        type: 'Burgers',
        price: '1.25\$',
      ),
      DishItem(
        name: 'Чизбургер', 
        image: const NetworkImage('https://burgerkingfrance.twic.pics/img/products/b/38/b38595ce-dfd5-4e28-bffc-2607cadd0ca8_?twic=v1/contain=700x700'),
        type: 'Burgers',
        price: '1.25\$',
      ),
      DishItem(
        name: 'Макфлури', 
        image: const NetworkImage('https://png.pngtree.com/png-clipart/20230425/ourmid/pngtree-cheese-burger-image-without-background-png-image_6728392.png'),
        type: 'Burgers',
        price: '2.55\$',
      ),
      DishItem(
        name: 'Четыре сыра', 
        image: const NetworkImage('https://staticcontent.mypizza.kg/Dishes/Imperiia_Pitstsyi/v45/Pitstsa_40sm/4_Syira_40sm/Medium.png?hash=f530c2fc1726d73286f6656fd56d59ae'),
        type: 'Pizza',
        price: '5.05\$',
      ),
      DishItem(
        name: 'Маргарита', 
        image: const NetworkImage('https://gus-khrustalny.muka-ris.ru/upload/iblock/175/1755068cd3fdd351c761a8321c18b37e.png'),
        type: 'Pizza',
        price: '3.15\$',
      ),
      DishItem(
        name: 'Кока-кола', 
        image: const NetworkImage('https://imgpng.ru/d/cocacola_PNG9.png'),
        type: 'Drinks',
        price: '1.05\$',
      ),
    ];

  const MainMenuScreen._init();

  factory MainMenuScreen(String filter) {
    _cachedMenu ??= const MainMenuScreen._init();

    currentDishes = filterDishes(filter);
    return _cachedMenu!;
  }

  static List<DishItem> filterDishes(String filter) => _dishes.where((element) => element.type == filter).toList();
  
  @override
  State<StatefulWidget> createState() => MainMenuState();
}

class MainMenuState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 31, 36),
      body: ListView( //По дефолту растягивает элементы до MediaQuery
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        children: MainMenuScreen.currentDishes,
      ),
    );
  }
}
