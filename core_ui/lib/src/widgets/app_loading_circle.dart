import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppLoadingCircle extends StatelessWidget {
  const AppLoadingCircle({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          color: AppColors.yellow,
        ),
    );
  }
}
