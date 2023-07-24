import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: AppIcons.selectedMenu,
                icon: AppIcons.unselectedMenu,
                label: AppConstants.menuTitle,
              ),
              BottomNavigationBarItem(
                activeIcon: AppIcons.selectedOrderHistory,
                icon: AppIcons.unselectedOrderHistory,
                label: AppConstants.orderHistoryTitle,
              ),
              BottomNavigationBarItem(
                activeIcon: AppIcons.selectedShoppingCart,
                icon: AppIcons.unselectedShoppingCart,
                label: AppConstants.shoppingCartTitle,
              ),
              BottomNavigationBarItem(
                activeIcon: AppIcons.selectedSettings,
                icon: AppIcons.unselectedSettings,
                label: AppConstants.settingsTitle,
              ),
            ],
          ),
        );
      },
    );
  }
}
