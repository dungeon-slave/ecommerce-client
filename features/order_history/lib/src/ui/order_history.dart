import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Text(
          AppConstants.orderHistoryTitle,
          style: AppFonts.normal25.copyWith(
            color: Theme.of(context).indicatorColor,
          ),
        ),
      ),
    );
  }
}
