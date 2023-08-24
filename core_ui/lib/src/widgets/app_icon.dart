import 'package:flutter/material.dart';

class AppIcon extends Icon {
  final double? _size;

  const AppIcon(
    super.icon, {
    double? size,
    super.key,
  }) : _size = size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      super.icon,
      size: _size,
    );
  }
}
