import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    final SettingsWidget settingsWidget = SettingsWidget.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          minimum: EdgeInsets.only(top: constraints.minHeight / 28),
          child: Scaffold(
            backgroundColor: themeData.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: themeData.scaffoldBackgroundColor,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  AppStrConstants.settingsTitle,
                  style: AppFonts.normal30.copyWith(
                    color: themeData.primaryColor,
                  ),
                ),
              ),
            ),
            body: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (_, SettingsState state) {
                return Container(
                  padding: const EdgeInsets.all(
                    AppDimens.padding20,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          top: AppDimens.padding10,
                          bottom: AppDimens.padding10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppStrConstants.darkTheme,
                              style: AppFonts.normal22.copyWith(
                                color: themeData.primaryColor,
                              ),
                            ),
                            Switch(
                              onChanged: (bool value) {
                                settingsBloc.add(
                                  SetThemeEvent(isDark: value),
                                );
                                settingsWidget.changeTheme(value);
                              },
                              activeColor: AppColors.yellow,
                              inactiveThumbColor: AppColors.absBlack,
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
                          children: <Widget>[
                            Text(
                              AppStrConstants.textScale,
                              style: AppFonts.normal22.copyWith(
                                color: themeData.primaryColor,
                              ),
                            ),
                            Slider(
                              value: state.textScale,
                              onChanged: (double value) {
                                settingsBloc.add(
                                  SetTextScaleEvent(textScale: value),
                                );
                                settingsWidget.changeTextScale(value);
                              },
                              min: AppNumConstants.minScale,
                              max: AppNumConstants.maxScale,
                              divisions: AppNumConstants.divisions,
                              activeColor: themeData.indicatorColor,
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        text: AppStrConstants.signOutTitle,
                        handler: () => settingsBloc.add(SignOutEvent()),
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
                                AppStrConstants.contactUs,
                                style: AppFonts.normal25.copyWith(
                                  color: themeData.primaryColor,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <AppButton>[
                                AppButton(
                                  text: AppStrConstants.telegramContactTitle,
                                  handler: () => settingsBloc.add(
                                    OpenLinkEvent(
                                      link: AppStrConstants.telegramLink,
                                    ),
                                  ),
                                ),
                                AppButton(
                                  text: AppStrConstants.instagramContactTitle,
                                  handler: () => settingsBloc.add(
                                    OpenLinkEvent(
                                      link: AppStrConstants.instagramLink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
