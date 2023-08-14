import 'package:core_ui/core_ui.dart' show AppColors;
import 'package:flutter/material.dart'
    show Brightness, IconThemeData, ThemeData;

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
