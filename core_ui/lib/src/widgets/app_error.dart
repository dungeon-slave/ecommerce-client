import 'package:core_ui/src/theme/themes.dart';
import 'package:flutter/widgets.dart';

class AppError extends StatelessWidget {
  final String _errorText;

  const AppError({
    required String errorText,
    super.key,
  }) : _errorText = errorText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _errorText,
        style: AppFonts.bold25.copyWith(
          color: AppColors.red,
        ),
      ),
    );
  }
}
