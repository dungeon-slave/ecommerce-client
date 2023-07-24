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
      appBar: const CustomAppBar(text: AppConstants.settingsTitle),
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
                        SetThemeEvent(isDark: value),
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
