import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String _text;
  final void Function() _handler;
  final TextStyle _textStyle;

  const AppTextButton({
    required String text,
    required void Function() handler,
    required TextStyle textStyle,
    super.key,
  })  : _text = text,
        _handler = handler,
        _textStyle = textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handler,
      child: Text(
        _text,
        style: _textStyle,
      ),
    );
  }
}
