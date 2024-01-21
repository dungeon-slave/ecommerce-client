import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return SafeArea(
          minimum: EdgeInsets.only(top: constraints.minHeight / 28),
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  AppStrConstants.menuTitle,
                  style: AppFonts.normal30.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
            body: const SizedBox.shrink(), //TODO create body
          ),
        );
      },
    );
  }
}
