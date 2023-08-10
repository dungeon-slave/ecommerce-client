import 'package:core_ui/core_ui.dart' show AppFonts;
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String _text;
  final void Function() _handler;

  const AppButton({
    super.key,
    required String text,
    required void Function() handler,
  })  : _text = text,
        _handler = handler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).indicatorColor),
      onPressed: _handler,
      child: Text(
        _text,
        style: AppFonts.normal25.copyWith(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
