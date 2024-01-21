import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';
import 'package:order_history/order_history.dart';
import 'package:order_history/src/ui/components/order_history_item.dart';

class OrderHistoryContent extends StatelessWidget {
  const OrderHistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return SafeArea(
          minimum: EdgeInsets.only(top: constraints.minHeight / 28),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: themeData.scaffoldBackgroundColor,
              title: Text(
                AppStrConstants.orderHistoryTitle,
                style: AppFonts.normal30.copyWith(
                  color: themeData.primaryColor,
                ),
              ),
            ),
            body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
              builder: (_, OrderHistoryState state) {
                if (state.isLoading) {
                  return const AppLoadingCircle();
                }
                if (state.errorMessage.isNotEmpty) {
                  return AppError(errorText: state.errorMessage);
                }
                if (state.items.isEmpty) {
                  return const EmptyList(link: AppAnimations.emptyList);
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(AppDimens.padding10),
                  itemCount: state.items.length,
                  itemBuilder: (_, int index) {
                    return OrderHistoryItem(
                      model: OrderModel(
                        id: state.items[index].id,
                        dateTime: state.items[index].dateTime,
                        price: state.items[index].price,
                        products: state.items[index].products,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
