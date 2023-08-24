import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dishes_menu/src/bloc/dishes_menu_screen/dishes_menu_bloc.dart';
import 'package:dishes_menu/src/ui/dish_item.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DishesMenuScreen extends StatefulWidget {
  const DishesMenuScreen({super.key});

  @override
  State<DishesMenuScreen> createState() => DishesMenuScreenState();
}

class DishesMenuScreenState extends State<DishesMenuScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  bool isTabControllerInited = false;

  void _handleSwipe(DragEndDetails details) {
    // Swiping in right direction.
    if (details.primaryVelocity! > AppNumConstants.swipesSensivity &&
        _tabController.index > 0) {
      _tabController.index--;
    }
    // Swiping in left direction.
    if (details.primaryVelocity! < -AppNumConstants.swipesSensivity &&
        _tabController.index < _tabController.length - 1) {
      _tabController.index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MenuBloc(
          fetchDishesUsecase: appLocator<FetchDishesUsecase>(),
          saveItemsUseCase: appLocator<SaveItemUseCase>(),
        );
      },
      child: BlocConsumer<MenuBloc, MenuState>(
        listener: (BuildContext context, MenuState state) {
          if (!isTabControllerInited && state.items.isNotEmpty) {
            isTabControllerInited = true;
            _tabController = TabController(
              initialIndex: 0,
              length: state.items.length,
              vsync: this,
              animationDuration: Duration.zero,
            );
            _tabController.addListener(
              () => BlocProvider.of<MenuBloc>(context).add(
                ChangeTypeEvent(_tabController.index),
              ),
            );
          }
        },
        builder: (BuildContext context, MenuState state) {
          if (state.errorMessage.isNotEmpty) {
            return AppError(errorText: state.errorMessage);
          }
          if (state.isLoading) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const AppLoadingCircle(),
            );
          }
          return GestureDetector(
            onHorizontalDragEnd: _handleSwipe,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SafeArea(
                  minimum: EdgeInsets.only(top: constraints.minHeight / 28),
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      toolbarHeight: 0,
                      bottom: TabBar(
                        controller: _tabController,
                        indicatorColor: Theme.of(context).indicatorColor,
                        unselectedLabelColor: Theme.of(context).primaryColor,
                        labelColor: Theme.of(context).indicatorColor,
                        isScrollable: true,
                        tabs: List.generate(
                          state.items.length,
                          (int index) => Tab(
                            child: Text(
                              state.items[index].name,
                              style: AppFonts.normal25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    body: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(AppDimens.padding10),
                        itemCount: state.items[state.currentTab].dishes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DishItem(
                            model: state.items[state.currentTab].dishes[index],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
