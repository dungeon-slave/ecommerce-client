import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.absWhite,
      primaryColor: AppColors.absBlack,
      cardColor: AppColors.absBlack,
      indicatorColor: AppColors.smoothYellow,
      shadowColor: AppColors.smoothBlue,
      iconTheme: const IconThemeData(
        color: AppColors.darkBreeze,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBreeze,
      primaryColor: AppColors.absWhite,
      cardColor: AppColors.cream,
      indicatorColor: AppColors.yellow,
      shadowColor: AppColors.smoothWhite,
      iconTheme: const IconThemeData(
        color: AppColors.absWhite,
      ),
    );
  }
}
