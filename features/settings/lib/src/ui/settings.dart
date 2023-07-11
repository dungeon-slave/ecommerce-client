import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dartBreeze,
      child: Center(
        child: Text(
          'Settings, soon...',
          style: AppFonts.normal25.copyWith(
            color: AppColors.smoothYellow,
          ),
        ),
      ),
    );
  }
}
