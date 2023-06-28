import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecase/fetch_dishes_usecase.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/src/bloc/bloc.dart';
import 'package:main_menu/src/ui/main_menu.dart';

class MenuTabBar extends StatelessWidget {
  const MenuTabBar({super.key});

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
                  backgroundColor: MyColors.dartBreeze,
                  toolbarHeight: 0,
                  bottom: TabBar(
                    indicatorColor: MyColors.smoothYellow,
                    unselectedLabelColor: MyColors.lightWhite,
                    labelColor: MyColors.smoothYellow,
                    isScrollable: true,
                    onTap: (value) {
                      BlocProvider.of<MenuBloc>(context)
                        .add(ChangeTypeEvent(dishesTypes[value]!));
                    },
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          dishesTypes[0]!,
                          style: Fonts.tabFont,
                        ),
                      ),
                      Tab(
                        child: Text(
                          dishesTypes[1]!,
                          style: Fonts.tabFont,
                        ),
                      ),
                      Tab(
                        child: Text(
                          dishesTypes[2]!,
                          style: Fonts.tabFont,
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
