import 'package:admin_home/admin_home_screen.dart';
import 'package:admin_menu/admin_menu.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:detailed_page/detailed_page.dart';
import 'package:dishes_menu/dishes_menu.dart';
import 'package:home_screen/home_screen.dart';
import 'package:main_screen/main_screen.dart';
import 'package:navigation/src/app_router/auth_guard.dart';
import 'package:navigation/src/hero_empty_router.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';
import 'package:sign_in_screen/sign_in_screen.dart';
import 'package:sign_up_screen/sign_up_screen.dart';
import 'package:users/users.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  modules: <Type>[
    MainScreenModule,
    SignInModule,
    SignUpModule,
    SettingsModule,
    DishesMenuModule,
    DetailedPageModule,
    OrderHistoryModule,
    ShoppingCartModule,
    AdminScreenModule,
    HomeScreenModule,
    UsersScreenModule,
    AdminMenuScreenModule,
  ],
)
class AppRouter extends _$AppRouter {
  final AuthGuard _authGuard;

  AppRouter({
    required AuthGuard authGuard,
  }) : _authGuard = authGuard;

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          path: '/',
          page: MainRoute.page,
          children: <AutoRoute>[
            AutoRoute(
              path: 'sign',
              page: EmptySign.page,
              children: <AutoRoute>[
                CustomRoute(
                  path: '',
                  page: SignInRoute.page,
                  durationInMilliseconds: AppNumConstants.nestedDuration,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                ),
                CustomRoute(
                  path: 'up',
                  page: SignUpRoute.page,
                  durationInMilliseconds: AppNumConstants.nestedDuration,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                ),
              ],
            ),
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
              initial: true,
              guards: <AutoRouteGuard>[_authGuard],
              children: <AutoRoute>[
                AutoRoute(
                  path: 'dishesMenu',
                  page: EmptyDishesMenu.page,
                  children: <AutoRoute>[
                    AutoRoute(
                      path: '',
                      page: DishesMenuRoute.page,
                    ),
                    AutoRoute(
                      path: 'detailedPage',
                      page: DetailedRoute.page,
                    ),
                  ],
                ),
                AutoRoute(
                  path: 'orderHistory',
                  page: OrderHistoryRoute.page,
                  maintainState: false,
                ),
                AutoRoute(
                  path: 'shoppingCart',
                  page: ShoppingCartRoute.page,
                  maintainState: false,
                ),
                AutoRoute(
                  path: 'settings',
                  page: SettingsRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'admin',
              page: AdminHomeRoute.page,
              children: <AutoRoute>[
                AutoRoute(
                  path: 'adminMenu',
                  page: AdminMenu.page,
                ),
                AutoRoute(
                  path: 'users',
                  page: Users.page,
                ),
                AutoRoute(
                  path: 'settings',
                  page: SettingsRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
