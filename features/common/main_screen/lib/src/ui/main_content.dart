import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:main_screen/src/bloc/main_screen_bloc.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsWidget settingsWidget = SettingsWidget.of(context);

    return BlocConsumer<MainScreenBloc, MainScreenState>(
      listener: (_, MainScreenState state) {
        settingsWidget.changeTheme(state.isDark);
        settingsWidget.changeTextScale(state.textScale);
      },
      builder: (_, MainScreenState state) {
        return state.isChecked ? const AutoRouter() : const AppLoadingCircle();
      },
    );
  }
}
