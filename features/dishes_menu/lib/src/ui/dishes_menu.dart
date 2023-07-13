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

  void addEvents(BuildContext context, MenuState state) {
    if (state is TabsListState) {
      _tabController = TabController(
          length: state.tabsNames.length,
          vsync: this,
          animationDuration: Duration.zero);
      _tabController.addListener(() {
        BlocProvider.of<MenuBloc>(context).add(
          GetDishesTypeEvent(_tabController.index),
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
        GetDishesTypeEvent(0),
      );
    }
    if (state is CurrentTabState) {
      BlocProvider.of<MenuBloc>(context).add(
        ChangeTypeEvent(state.currentTabName),
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

  Widget buildMenu(MenuState state) {
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
              unselectedLabelColor: AppColors.ligthWhite,
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
      return Center(
        child: Text(
          state.errorMessage,
          style: AppFonts.bold25.copyWith(
            color: AppColors.red,
          ),
        ),
      );
    }
    return Container(
      color: AppColors.dartBreeze,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.smoothYellow,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MenuBloc(
        appLocator<FetchDishesUsecase>(),
      ),
      child: BlocConsumer<MenuBloc, MenuState>(
        listener: (BuildContext context, MenuState state) =>
            addEvents(context, state),
        builder: (BuildContext context, MenuState state) => buildMenu(state),
        listenWhen: (MenuState previous, MenuState current) =>
            previous != current &&
            (current is TabsListState || current is CurrentTabState),
        buildWhen: (MenuState previous, MenuState current) =>
            previous != current &&
            (current is DishesListState || current is ErrorState),
      ),
    );
  }
}
