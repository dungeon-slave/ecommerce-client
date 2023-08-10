import 'package:core/core.dart' show BlocProvider, BlocBuilder, Bloc;
import 'package:core/di/app_di.dart';
import 'package:core/services/network_service.dart';
import 'package:core_ui/core_ui.dart' show AppIcons, AppConstants;
import 'package:domain/usecase/home_screen/fetch_cart_count_usecase.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/src/bloc/cart_observer.dart';
import 'package:home_screen/src/bloc/home_screen_bloc.dart';
import 'package:home_screen/src/ui/components/cart_count_badge.dart';
import 'package:home_screen/src/ui/components/network_popup.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenBloc(
        fetchCartCountUseCase: appLocator<FetchCartCountUseCase>(),
        networkService: appLocator<NetworkService>(),
      ),
      child: Stack(
        children: <Widget>[
          AutoTabsScaffold(
            routes: const <PageRouteInfo>[
              MenuRoute(),
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
                      activeIcon: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                        builder: (context, state) {
                          return CartCountBadge(
                            count: state.count,
                            themeIcon: AppIcons.selectedShoppingCart,
                          );
                        },
                      ),
                      icon: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                        builder: (context, state) {
                          return CartCountBadge(
                            count: state.count,
                            themeIcon: AppIcons.unselectedShoppingCart,
                          );
                        },
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
