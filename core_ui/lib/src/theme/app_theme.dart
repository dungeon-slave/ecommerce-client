import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightWhite,
      primaryColor: AppColors.dartBreeze,
      cardColor: AppColors.smoothGreen,
      indicatorColor: AppColors.smoothYellow,
      shadowColor: AppColors.smoothBlue,
      iconTheme: const IconThemeData(
        color: AppColors.dartBreeze,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.dartBreeze,
      primaryColor: AppColors.lightWhite,
      cardColor: AppColors.smoothBrown,
      indicatorColor: AppColors.yellow,
      shadowColor: AppColors.smoothWhite,
      iconTheme: const IconThemeData(
        color: AppColors.lightWhite,
      ),
    );
  }
}
