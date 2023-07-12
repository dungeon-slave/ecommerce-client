import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecase/fetch_dishes_usecase.dart';
import 'package:flutter/material.dart';

import '../bloc/dishes_menu_screen/dishes_menu_bloc.dart';
import 'menu_list.dart';

class DishesMenuScreen extends StatefulWidget {
  const DishesMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() => DishesMenuScreenState();
}

class DishesMenuScreenState extends State<DishesMenuScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final List<Tab> _tabs = [];

  void initTabs(BuildContext context, MenuState state) {
    if (state is TabsListState) {
      _tabController = TabController(
          initialIndex: 0,
          length: state.tabsNames.length,
          vsync: this,
          animationDuration: Duration.zero);
      _tabController.addListener(() {
        BlocProvider.of<MenuBloc>(context).add(
          ChangeTypeEvent(_tabController.index),
        );
      });
      for (String tabName in state.tabsNames) {
        _tabs.add(
          Tab(
            child: Text(
              tabName,
              style: AppFonts.normal25,
            ),
          ),
        );
      }
      BlocProvider.of<MenuBloc>(context).add(
        ChangeTypeEvent(0),
      );
    }
  }

  void handleSwipe(DragEndDetails details) {
    // Swiping in right direction.
    int sensitivy = 3;
    if (details.primaryVelocity! > sensitivy && _tabController.index > 0) {
      _tabController.index--;
    }

    // Swiping in left direction.
    if (details.primaryVelocity! < -sensitivy &&
        _tabController.index < _tabController.length - 1) {
      _tabController.index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MenuBloc(
        appLocator<FetchDishesUsecase>(),
      ),
      child: BlocConsumer<MenuBloc, MenuState>(
        listener: (BuildContext context, MenuState state) =>
            initTabs(context, state),
        builder: (BuildContext context, MenuState state) {
          if (state is DishesListState) {
            return GestureDetector(
              onHorizontalDragEnd: handleSwipe,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.dartBreeze,
                  toolbarHeight: 0,
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.smoothYellow,
                    unselectedLabelColor: AppColors.lightWhite,
                    labelColor: AppColors.smoothYellow,
                    isScrollable: true,
                    tabs: _tabs,
                  ),
                ),
                body: MenuList(state.dishes),
              ),
            );
          }
          if (state is ErrorState) {
            return AppError(errorText: state.errorMessage);
          }
          return const AppLoadingCircle();
        },
      ),
    );
  }
}
