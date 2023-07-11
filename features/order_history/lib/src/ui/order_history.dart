import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dartBreeze,
      child: Center(
        child: Text(
          'Order history coming soon...',
          style: AppFonts.normal25.copyWith(
            color: AppColors.smoothYellow,
          ),
        ),
      ),
    );
  }
}
