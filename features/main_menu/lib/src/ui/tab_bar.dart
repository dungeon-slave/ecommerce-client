import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecase/fetch_dishes_usecase.dart';
import 'package:flutter/material.dart';
import 'package:main_menu/src/bloc/bloc.dart';
import 'package:main_menu/src/ui/main_menu.dart';

class MenuTabBar extends StatelessWidget {
  const MenuTabBar({super.key});

//TODO Move dishesTypes into state
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
    return const Text(AppConstants.EMPTY_STATE);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (BuildContext context) => MenuBloc(
        appLocator.get<FetchDishesUsecase>(),
      ) 
        //TODO Refactor TabController to custom and when initialize it, call InitEvent
        ..add(ChangeTypeEvent(dishesTypes[0]!)),
      child: BlocBuilder<MenuBloc, IMenuState>(
        builder: (BuildContext context, IMenuState state) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.DART_BREEZE,
                  toolbarHeight: 0,
                  bottom: TabBar(
                    indicatorColor: AppColors.SMOOTH_YELLOW,
                    unselectedLabelColor: AppColors.LIGHT_WHITE,
                    labelColor: AppColors.SMOOTH_YELLOW,
                    isScrollable: true,
                    onTap: (value) {
                      BlocProvider.of<MenuBloc>(context).add(
                        ChangeTypeEvent(dishesTypes[value]!),
                      );
                    },
                    tabs: <Tab>[
                      Tab(
                        child: Text(
                          dishesTypes[0]!,
                          style: AppFonts.normal25,
                        ),
                      ),
                      Tab(
                        child: Text(
                          dishesTypes[1]!,
                          style: AppFonts.normal25,
                        ),
                      ),
                      Tab(
                        child: Text(
                          dishesTypes[2]!,
                          style: AppFonts.normal25,
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
