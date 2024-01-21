import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/shopping_cart/send_order_usecase.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:shopping_cart/src/ui/shopping_cart_content.dart';

@RoutePage()
class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShoppingCartBloc(
        fetchItemsUseCase: appLocator<FetchItemsUseCase>(),
        changeItemCountUseCase: appLocator<ChangeItemCountUseCase>(),
        clearCartUseCase: appLocator<ClearCartUseCase>(),
        sendOrderUseCase: appLocator<SendOrderUseCase>(),
      ),
      child: const ShoppingCartContent(),
    );
  }
}
