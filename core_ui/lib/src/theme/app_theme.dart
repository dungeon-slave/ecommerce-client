import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.absWhite,
      primaryColor: AppColors.absBlack,
      cardColor: AppColors.smoothWhite,
      indicatorColor: AppColors.absBlack,
      shadowColor: AppColors.smoothWhite,
      iconTheme: const IconThemeData(
        color: AppColors.absBlack,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBreeze,
      primaryColor: AppColors.absWhite,
      cardColor: AppColors.smoothDarkBreeze,
      indicatorColor: AppColors.yellow,
      shadowColor: AppColors.smoothDarkBreeze,
      iconTheme: const IconThemeData(
        color: AppColors.absWhite,
      ),
    );
  }
}
