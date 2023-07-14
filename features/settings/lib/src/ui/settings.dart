import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../settings.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          AppConstants.navBarSettings,
          style: AppFonts.normal25.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(AppDimens.padding20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppConstants.darkTheme,
                      style: AppFonts.normal22.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Switch(
                      onChanged: (bool value) =>
                          BlocProvider.of<SettingsBloc>(context).add(
                        SwitchThemeEvent(isDark: value),
                      ),
                      activeColor: AppColors.yellow,
                      inactiveThumbColor: AppColors.smoothYellow,
                      value: state.isDark,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
