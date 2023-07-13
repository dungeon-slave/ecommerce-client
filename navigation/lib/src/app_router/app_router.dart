import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:dishes_menu/dishes_menu.dart';
import 'package:home_screen/home_screen.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

part 'app_router.gr.dart';   

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomeScreen,
      children: <AutoRoute>[
        AutoRoute(
          path: 'dishes_menu',
          page: DishesMenuScreen,
        ),
        AutoRoute(
          path: 'order_history',
          page: OrderHistoryScreen,
        ),
        AutoRoute(
          path: 'shopping_cart',
          page: ShoppingCartScreen,
        ),
        AutoRoute(
          path: 'settings',
          page: AppSettingsScreen,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
