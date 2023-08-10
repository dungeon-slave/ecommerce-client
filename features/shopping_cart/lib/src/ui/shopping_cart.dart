import 'package:core/core.dart' show BlocProvider, BlocBuilder;
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:shopping_cart/src/ui/cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShoppingCartBloc(
        fetchItemsUseCase: appLocator<FetchItemsUseCase>(),
        changeItemCountUseCase: appLocator<ChangeItemCountUseCase>(),
        clearCartUseCase: appLocator<ClearCartUseCase>(),
      ),
      child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (BuildContext context, ShoppingCartState state) {
          if (state.isLoading) {
            return const AppLoadingCircle();
          }
          if (state.errorMessage.isNotEmpty) {
            return AppError(errorText: state.errorMessage);
          }
          return Scaffold(
            appBar: AppBar(
              actions: <Container>[
                Container(
                  margin: const EdgeInsets.only(right: AppDimens.padding10),
                  child: IconButton(
                    iconSize: AppConstants.deleteIconSize,
                    icon: AppIcons.clearCart,
                    onPressed: () =>
                        BlocProvider.of<ShoppingCartBloc>(context).add(
                      ClearCartEvent(),
                    ),
                  ),
                ),
              ],
              iconTheme: Theme.of(context).iconTheme,
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                AppConstants.shoppingCartTitle,
                style: AppFonts.normal25.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.only(bottom: AppDimens.padding100),
              child: ListView.builder(
                padding: const EdgeInsets.all(AppDimens.padding10),
                itemCount: state.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartItem(
                    model: CartItemModel(
                      dishModel: state.items[index].dishModel,
                      count: state.items[index].count,
                    ),
                  );
                },
              ),
            ),
            bottomSheet: Container(
              padding: const EdgeInsets.all(AppDimens.padding10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(color: Theme.of(context).indicatorColor),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Text>[
                      const Text(
                        AppConstants.cartTotal,
                        style: AppFonts.normal22,
                      ),
                      Text(
                        '${state.totalPrice().toStringAsFixed(AppConstants.priceSize)}\$',
                        style: AppFonts.normal22,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: AppDimens.size400, //FIXME make adaptive size
                    child: AppButton(
                      text: AppConstants.cartCheckout,
                      handler: () =>
                          BlocProvider.of<ShoppingCartBloc>(context).add(
                        CheckoutEvent(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
