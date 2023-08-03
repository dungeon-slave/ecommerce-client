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
            padding: const EdgeInsets.all(
              AppDimens.padding20,
            ),
            child: Column(
              children: <Container>[
                Container(
                  margin: const EdgeInsets.only(
                    top: AppDimens.padding10,
                    bottom: AppDimens.padding10,
                  ),
                  child: Row(
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
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: AppDimens.padding10,
                    bottom: AppDimens.padding10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppConstants.textScale,
                        style: AppFonts.normal22.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      ToggleButtons(
                        onPressed: (int index) =>
                            BlocProvider.of<SettingsBloc>(context).add(
                          SetTextScaleEvent(
                            textScale: AppConstants.textScales[index],
                          ),
                        ),
                        textStyle: AppFonts.normal22,
                        borderColor: Theme.of(context).cardColor,
                        borderWidth: AppDimens.size2,
                        borderRadius:
                            BorderRadius.circular(AppDimens.padding20),
                        selectedColor: Theme.of(context).indicatorColor,
                        disabledColor: Theme.of(context).primaryColor,
                        selectedBorderColor: Theme.of(context).indicatorColor,
                        splashColor: Theme.of(context).shadowColor,
                        isSelected: List.generate(
                          AppConstants.textScales.length,
                          (int index) =>
                              AppConstants.textScales[index] == state.textScale,
                        ),
                        children: List.generate(
                          AppConstants.textScales.length,
                          (int index) => Text(
                            AppConstants.textScales[index].toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: AppDimens.padding15,
                    bottom: AppDimens.padding10,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: AppDimens.padding15,
                        ),
                        child: Text(
                          AppConstants.contactUs,
                          style: AppFonts.normal25.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <AppButton>[
                          AppButton(
                            text: AppConstants.telegramContactTitle,
                            handler: () =>
                                BlocProvider.of<SettingsBloc>(context).add(
                              OpenLinkEvent(
                                link: Uri.parse(
                                  AppConstants.telegramLink,
                                ),
                              ),
                            ),
                          ),
                          AppButton(
                            text: AppConstants.instagramContactTitle,
                            handler: () =>
                                BlocProvider.of<SettingsBloc>(context).add(
                              OpenLinkEvent(
                                link: Uri.parse(
                                  AppConstants.instagramLink,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: AppButton(
                    text: AppConstants.signOutTitle,
                    handler: () => BlocProvider.of<SettingsBloc>(context).add(
                      SignOutEvent(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
