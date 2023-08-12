import 'package:core_ui/src/theme/app_constants.dart';
import 'package:core_ui/src/theme/fonts.dart';
import 'package:flutter/material.dart';

class EmptyListTitle extends StatelessWidget {
  const EmptyListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppConstants.emptyList,
        style: AppFonts.normal30.copyWith(
          color: Theme.of(context).indicatorColor,
        ),
      ),
    );
  }
}
