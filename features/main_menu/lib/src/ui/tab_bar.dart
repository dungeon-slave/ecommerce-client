import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/usecase/fetch_dishes_usecase.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/src/bloc/bloc.dart';
import 'package:main_menu/src/ui/main_menu.dart';

class MenuTabBar extends StatelessWidget {
  const MenuTabBar({super.key});

  static const _tabStyle = TextStyle(fontSize: 25);
  static const _bgColor = Color.fromARGB(255, 0, 31, 36);
  static const _selectedColor = Color.fromARGB(255, 248, 193, 52);
  static const _unselectedColor = Color.fromARGB(255, 255, 255, 255);

  static const Map<int, String> dishesTypes = {
    0: 'Burgers',
    1: 'Pizza',
    2: 'Drinks'
  };

  Widget getMainMenu(IMenuState state) {
    if (state is ErrorState) {
      return Center(child: Text(state.errorMessage));
    }
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is MenuState) {
      return MainMenu(state.dishes);
    }
    return const Text('Nothing');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (BuildContext context) =>
          MenuBloc(appLocator.get<FetchDishesUsecase>())
            ..add(ChangeTypeEvent(dishesTypes[0]!)),
      child: BlocBuilder<MenuBloc, IMenuState>(
        builder: (BuildContext context, IMenuState state) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: _bgColor,
                  toolbarHeight: 0,
                  bottom: TabBar(
                    indicatorColor: _selectedColor,
                    unselectedLabelColor: _unselectedColor,
                    labelColor: _selectedColor,
                    isScrollable: true,
                    onTap: (value) {
                      BlocProvider.of<MenuBloc>(context)
                        .add(ChangeTypeEvent(dishesTypes[value]!));
                    },
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          dishesTypes[0]!,
                          style: _tabStyle,
                        ),
                      ),
                      Tab(
                        child: Text(
                          dishesTypes[1]!,
                          style: _tabStyle,
                        ),
                      ),
                      Tab(
                        child: Text(
                          dishesTypes[2]!,
                          style: _tabStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                body: getMainMenu(state)),
          );
        },
      ),
    );
  }
}
