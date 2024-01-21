import 'package:core/core.dart' show Lottie;
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final EdgeInsets? _margin;
  final String _link;

  const EmptyList({
    required String link,
    EdgeInsets? margin,
    super.key,
  })  : _margin = margin,
        _link = link;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: _margin ?? EdgeInsets.zero,
        child: Lottie.asset(
          _link,
          repeat: false,
        ),
      ),
    );
  }
}
