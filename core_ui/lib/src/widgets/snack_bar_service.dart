import 'package:core_ui/src/theme/app_dimens.dart';
import 'package:core_ui/src/theme/app_num_constants.dart';
import 'package:core_ui/src/theme/fonts.dart';
import 'package:flutter/material.dart';

abstract class SnackBarService {
  static void show({
    required BuildContext context,
    required String title,
    EdgeInsets? snackMargin,
  }) {
    final ThemeData themeData = Theme.of(context);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        _buildSnackBar(
          themeData,
          snackMargin,
          title,
        ),
      );
  }

  static SnackBar _buildSnackBar(
    ThemeData themeData,
    EdgeInsetsGeometry? snackMargin,
    String title,
  ) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(
        seconds: AppNumConstants.cartSnackBarDuration,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: themeData.indicatorColor,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radius10),
      ),
      backgroundColor: themeData.scaffoldBackgroundColor,
      margin: snackMargin,
      content: Center(
        child: Text(
          title,
          style: AppFonts.normal22.copyWith(
            color: themeData.indicatorColor,
          ),
        ),
      ),
    );
  }
}
