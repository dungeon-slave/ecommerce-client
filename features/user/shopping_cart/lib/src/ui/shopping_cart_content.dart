import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping_cart.dart';

class ShoppingCartContent extends StatelessWidget {
  const ShoppingCartContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ShoppingCartBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartBloc>(context);
    final ThemeData themeData = Theme.of(context);

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return SafeArea(
          minimum: EdgeInsets.only(top: constraints.minHeight / 28),
          child: Scaffold(
            appBar: AppBar(
              actions: <Container>[
                Container(
                  margin: const EdgeInsets.only(right: AppDimens.padding10),
                  child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                    builder: (_, ShoppingCartState state) {
                      return IconButton(
                        iconSize: AppNumConstants.deleteIconSize,
                        icon: const AppIcon(AppIconsData.clearCart),
                        onPressed: () => shoppingCartBloc.add(ClearCartEvent()),
                      );
                    },
                  ),
                ),
              ],
              iconTheme: themeData.iconTheme,
              centerTitle: true,
              backgroundColor: themeData.scaffoldBackgroundColor,
              title: Text(
                AppStrConstants.shoppingCartTitle,
                style: AppFonts.normal30.copyWith(
                  color: themeData.primaryColor,
                ),
              ),
            ),
            body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
              builder: (_, ShoppingCartState state) {
                if (state.isLoading) {
                  return const AppLoadingCircle();
                }
                if (state.errorMessage.isNotEmpty) {
                  return AppError(errorText: state.errorMessage);
                }
                if (state.items.isEmpty) {
                  return EmptyList(
                    margin: EdgeInsets.only(
                      bottom: constraints.minHeight / 8,
                    ),
                    link: state.isOrdered
                        ? AppAnimations.ordered
                        : AppAnimations.emptyList,
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(bottom: AppDimens.padding100),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppDimens.padding10),
                    itemCount: state.items.length,
                    itemBuilder: (_, int index) {
                      return CartItem(
                        model: state.items[index],
                      );
                    },
                  ),
                );
              },
            ),
            bottomSheet: Container(
              padding: const EdgeInsets.all(AppDimens.padding10),
              decoration: BoxDecoration(
                color: themeData.scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(color: themeData.indicatorColor),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        AppStrConstants.total,
                        style: AppFonts.normal22,
                      ),
                      BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                        builder: (_, ShoppingCartState state) {
                          return Text(
                            '${state.totalPrice().toStringAsFixed(AppNumConstants.priceSize)}\$',
                            style: AppFonts.normal22,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: constraints.minWidth,
                    child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                      builder: (_, ShoppingCartState state) {
                        return AppButton(
                          text: AppStrConstants.cartCheckout,
                          handler: () {
                            if (state.items.isNotEmpty) {
                              shoppingCartBloc.add(CheckoutEvent());
                            }
                            SnackBarService.show(
                              context: context,
                              title: state.items.isNotEmpty
                                  ? AppStrConstants.orderSent
                                  : AppStrConstants.emptyOrder,
                              snackMargin: EdgeInsets.only(
                                left: constraints.minWidth / 40,
                                right: constraints.minWidth / 40,
                                bottom: constraints.minHeight / 7.5,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
