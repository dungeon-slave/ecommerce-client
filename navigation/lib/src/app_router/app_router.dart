import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:detailed_page/detailed_page.dart';
import 'package:dishes_menu/dishes_menu.dart';
import 'package:domain/models/dishes_items/dish_model.dart';
import 'package:flutter/material.dart';

import 'package:home_screen/home_screen.dart';
import 'package:main_page_screen/main_page_screen.dart';
import 'package:navigation/src/app_router/auth_guard.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';
import 'package:sign_in_screen/sign_in_screen.dart';
import 'package:sign_up_screen/sign_up_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: MainPageScreen,
      name: 'MainPageRouter',
      initial: true,
      children: <AutoRoute>[
        AutoRoute(
          path: 'sign',
          name: 'SignRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              initial: true,
              page: SignInScreen,
              path: 'sign',
            ),
            AutoRoute(
              page: SignUpScreen,
              path: 'up',
            ),
            RedirectRoute(
              path: 'up',
              redirectTo: '',
            ),
          ],
        ),
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: HomeScreen,
          guards: [AuthGuard],
          children: <AutoRoute>[
            AutoRoute(
              name: 'EmptyRoute',
              path: 'dishes_menu',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  name: 'DishesMenuRouter',
                  path: '',
                  page: DishesMenuScreen,
                ),
                AutoRoute(
                  path: ':dishId',
                  page: DetailedPageScreen,
                ),
                RedirectRoute(
                  path: ':dishId',
                  redirectTo: '',
                ),
              ],
            ),
            AutoRoute(
              path: 'order_history',
              page: OrderHistoryScreen,
            ),
            AutoRoute(
              path: 'shopping_cart',
              page: ShoppingCartScreen,
              maintainState: false,
            ),
            AutoRoute(
              path: 'settings',
              page: AppSettingsScreen,
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
