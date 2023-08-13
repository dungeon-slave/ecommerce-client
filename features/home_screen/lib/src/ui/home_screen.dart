import 'package:core/core.dart'
    show
        AutoTabsScaffold,
        Bloc,
        BlocBuilder,
        BlocProvider,
        PageRouteInfo,
        RoutePage,
        TabsRouter;
import 'package:core/di/app_di.dart';
import 'package:core/services/network_service.dart';
import 'package:core_ui/core_ui.dart' show AppConstants, AppIcon, AppIconsData;
import 'package:dishes_menu/dishes_menu.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/src/bloc/cart_observer.dart';
import 'package:home_screen/src/bloc/home_screen_bloc.dart';
import 'package:home_screen/src/ui/components/cart_count_badge.dart';
import 'package:home_screen/src/ui/components/network_popup.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenBloc(
        fetchCartCountUseCase: appLocator<FetchCartCountUseCase>(),
        networkService: appLocator<NetworkService>(),
        fetchTextScaleUseCase: appLocator<FetchTextScaleUseCase>(),
        fetchThemeUseCase: appLocator<FetchThemeUseCase>(),
      ),
      child: Stack(
        children: <Widget>[
          AutoTabsScaffold(
            routes: const <PageRouteInfo>[
              EmptyDishesMenu(),
              OrderHistoryRoute(),
              ShoppingCartRoute(),
              SettingsRoute(),
            ],
            animationDuration: Duration.zero,
            bottomNavigationBuilder: (BuildContext context, TabsRouter router) {
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
                      activeIcon: AppIcon(AppIconsData.selectedMenu),
                      icon: AppIcon(AppIconsData.unselectedMenu),
                      label: AppConstants.menuTitle,
                    ),
                    const BottomNavigationBarItem(
                      activeIcon: AppIcon(AppIconsData.selectedOrderHistory),
                      icon: AppIcon(AppIconsData.unselectedOrderHistory),
                      label: AppConstants.orderHistoryTitle,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                        builder: (context, state) {
                          return CartCountBadge(
                            count: state.count,
                            themeIcon:
                                const AppIcon(AppIconsData.selectedShoppingCart),
                          );
                        },
                      ),
                      icon: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                        builder: (context, state) {
                          return CartCountBadge(
                            count: state.count,
                            themeIcon:
                                const AppIcon(AppIconsData.unselectedShoppingCart),
                          );
                        },
                      ),
                      label: AppConstants.shoppingCartTitle,
                    ),
                    const BottomNavigationBarItem(
                      activeIcon: AppIcon(AppIconsData.selectedSettings),
                      icon: AppIcon(AppIconsData.unselectedSettings),
                      label: AppConstants.settingsTitle,
                    ),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (BuildContext context, HomeScreenState state) {
              Bloc.observer = CartObserver(context: context);
              if (state.isVisibleMessage) {
                return NetworkPopUp(isConnected: state.isConnected);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
