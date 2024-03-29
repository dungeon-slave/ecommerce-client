import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController _textController;
  final String _label;
  final bool _isObscure;

  const AppTextField({
    required TextEditingController textController,
    required String label,
    required bool isObscure,
    super.key,
  })  : _textController = textController,
        _label = label,
        _isObscure = isObscure;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return TextField(
      obscureText: _isObscure,
      cursorColor: themeData.indicatorColor,
      style: AppFonts.normal20.copyWith(
        color: themeData.primaryColor,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeData.indicatorColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.radius10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeData.indicatorColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.radius10),
          ),
        ),
        labelText: _label,
        labelStyle: AppFonts.normal20.copyWith(
          color: themeData.indicatorColor,
        ),
      ),
      controller: _textController,
    );
  }
}
