import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/src/bloc/cart_observer.dart';
import 'package:home_screen/src/bloc/home_screen_bloc.dart';
import 'package:home_screen/src/ui/components/cart_count_badge.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

import 'components/network_popup.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Stack(
      children: <Widget>[
        AutoTabsScaffold(
          routes: const <PageRouteInfo>[
            EmptyDishesMenu(),
            OrderHistoryRoute(),
            ShoppingCartRoute(),
            SettingsRoute(),
          ],
          animationCurve: Curves.linear,
          animationDuration: const Duration(
            milliseconds: AppNumConstants.mainDuration,
          ),
          transitionBuilder: (_, Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          bottomNavigationBuilder: (_, TabsRouter router) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: themeData.indicatorColor),
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: themeData.scaffoldBackgroundColor,
                currentIndex: router.activeIndex,
                onTap: router.setActiveIndex,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: themeData.indicatorColor,
                unselectedItemColor: themeData.indicatorColor,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    activeIcon: AppIcon(AppIconsData.selectedMenu),
                    icon: AppIcon(AppIconsData.unselectedMenu),
                    label: AppStrConstants.menuTitle,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: AppIcon(AppIconsData.selectedOrderHistory),
                    icon: AppIcon(AppIconsData.unselectedOrderHistory),
                    label: AppStrConstants.orderHistoryTitle,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: CartCountBadge(
                      themeIcon: AppIcon(
                        AppIconsData.selectedShoppingCart,
                      ),
                    ),
                    icon: CartCountBadge(
                      themeIcon: AppIcon(
                        AppIconsData.unselectedShoppingCart,
                      ),
                    ),
                    label: AppStrConstants.shoppingCartTitle,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: AppIcon(AppIconsData.selectedSettings),
                    icon: AppIcon(AppIconsData.unselectedSettings),
                    label: AppStrConstants.settingsTitle,
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
    );
  }
}
