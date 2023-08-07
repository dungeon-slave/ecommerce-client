import 'package:core_ui/src/theme/fonts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _text;

  const CustomAppBar({
    required String text,
    super.key,
  })  : _text = text,
        preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        _text,
        style: AppFonts.normal25.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
