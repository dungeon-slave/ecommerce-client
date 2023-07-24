import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecase/home_screen/get_cart_count_usecase.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/src/bloc/cart_observer.dart';
import 'package:home_screen/src/bloc/home_screen_bloc.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        EmptyRoute(),
        OrderHistoryRoute(),
        ShoppingCartRoute(),
        AppSettingsRoute(),
      ],
      animationDuration: Duration.zero,
      bottomNavigationBuilder: (BuildContext context, TabsRouter router) {
        return BlocProvider(
          create: (BuildContext context) =>
              HomeScreenBloc(appLocator<GetCartCountUseCase>()),
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (BuildContext context, HomeScreenState state) {
              Bloc.observer = CartObserver(context: context);
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Theme.of(context).indicatorColor),
                  ),
                ),
                child: BottomNavigationBar(
                  currentIndex: router.activeIndex,
                  onTap: router.setActiveIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  selectedItemColor: Theme.of(context).indicatorColor,
                  unselectedItemColor: Theme.of(context).indicatorColor,
                  items: <BottomNavigationBarItem>[
                    const BottomNavigationBarItem(
                      activeIcon: AppIcons.selectedMenu,
                      icon: AppIcons.unselectedMenu,
                      label: AppConstants.menuTitle,
                    ),
                    const BottomNavigationBarItem(
                      activeIcon: AppIcons.selectedOrderHistory,
                      icon: AppIcons.unselectedOrderHistory,
                      label: AppConstants.orderHistoryTitle,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Badge(
                        offset: const Offset(
                          AppDimens.margin5,
                          -AppDimens.margin5,
                        ),
                        label: Text(state.count.toString()),
                        child: AppIcons.selectedShoppingCart,
                      ),
                      icon: Badge(
                        offset: const Offset(
                          AppDimens.margin5,
                          -AppDimens.margin5,
                        ),
                        label: Text(state.count.toString()),
                        child: AppIcons.unselectedShoppingCart,
                      ),
                      label: AppConstants.shoppingCartTitle,
                    ),
                    const BottomNavigationBarItem(
                      activeIcon: AppIcons.selectedSettings,
                      icon: AppIcons.unselectedSettings,
                      label: AppConstants.settingsTitle,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
