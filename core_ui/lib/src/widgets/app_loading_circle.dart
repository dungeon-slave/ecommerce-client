import 'package:core_ui/src/theme/colors.dart';
import 'package:flutter/material.dart';

class AppLoadingCircle extends StatelessWidget {
  const AppLoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dartBreeze,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.smoothYellow,
        ),
      ),
    );
  }
}
