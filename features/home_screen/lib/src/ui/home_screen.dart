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
    return BlocProvider(
      create: (BuildContext context) => HomeScreenBloc(
        appLocator<GetCartCountUseCase>(),
      ),
      child: Stack( //TODO try overlay entry
        children: <Widget>[
          AutoTabsScaffold(
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
                        label: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                          builder: (context, state) {
                            return Text(state.count.toString());
                          },
                        ),
                        child: AppIcons.selectedShoppingCart,
                      ),
                      icon: Badge(
                        offset: const Offset(
                          AppDimens.margin5,
                          -AppDimens.margin5,
                        ),
                        label: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                          builder: (context, state) {
                            return Text(state.count.toString());
                          },
                        ),
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
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (BuildContext context, HomeScreenState state) {
              if (Bloc.observer is! CartObserver) {
                Bloc.observer = CartObserver(context: context);
              }
              if (state.isVisibleMessage) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: AppDimens.size380,
                    margin: const EdgeInsets.only(
                      bottom: AppDimens.padding65,
                    ),
                    decoration: BoxDecoration(
                      color:
                          state.isConnected ? AppColors.green : AppColors.red,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimens.radius10),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: AppDimens.padding10,
                      bottom: AppDimens.padding10,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      state.isConnected
                          ? AppConstants.connectionRestored
                          : AppConstants.connectionLoss,
                      style: AppFonts.normal24.copyWith(
                        color: AppColors.absWhite,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
