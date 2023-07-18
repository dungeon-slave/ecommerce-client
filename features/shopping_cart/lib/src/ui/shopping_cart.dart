import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/ui/cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Container>[
          Container(
            margin: const EdgeInsets.only(right: AppDimens.padding10),
            child: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.delete),
              onPressed: () => {},
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
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const CartItem(
              itemName: 'Гамбургер',
              itemPrice: '5.50\$',
            );
          },
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(AppDimens.margin5 * 2),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).indicatorColor),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Text>[
                Text(
                  'Total',
                  style: AppFonts.normal22,
                ),
                Text(
                  '10\$',
                  style: AppFonts.normal22,
                ),
              ],
            ),
            SizedBox(
              width: AppDimens.padding100 * 4,
              child: AppButton(text: 'Checkout', handler: () => {}),
            ),
          ],
        ),
      ),
    );
  }
}
