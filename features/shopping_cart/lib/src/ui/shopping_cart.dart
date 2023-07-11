import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dartBreeze,
      child: Center(
        child: Text(
          'Shopping cart, soon...',
          style: AppFonts.normal25.copyWith(
            color: AppColors.smoothYellow,
          ),
        ),
      ),
    );
  }
}
