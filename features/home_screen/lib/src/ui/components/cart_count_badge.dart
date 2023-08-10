import 'package:core_ui/core_ui.dart' show AppDimens;
import 'package:flutter/material.dart';

class CartCountBadge extends StatelessWidget {
  final int _count;
  final Icon _themeIcon;

  const CartCountBadge({
    required int count,
    required Icon themeIcon,
    super.key,
  })  : _count = count,
        _themeIcon = themeIcon;

  @override
  Widget build(BuildContext context) {
    return Badge(
      offset: const Offset(
        AppDimens.margin5,
        -AppDimens.margin5,
      ),
      label: Text(_count.toString()),
      child: _themeIcon,
    );
  }
}
