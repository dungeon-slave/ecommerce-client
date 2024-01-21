import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/usecase/order_history/fetch_order_history.dart';
import 'package:flutter/material.dart';
import 'package:order_history/src/bloc/order_history_bloc.dart';

import 'order_history_content.dart';

@RoutePage()
class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderHistoryBloc(
        fetchOrderHistoryUseCase: appLocator<FetchOrderHistoryUseCase>(),
      ),
      child: const OrderHistoryContent(),
    );
  }
}
