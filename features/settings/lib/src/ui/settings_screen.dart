import 'package:core/core.dart'
    show AuthService, BlocBuilder, BlocProvider, RoutePage, UrlService;
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/src/bloc/settings/settings_bloc_bloc.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsBloc(
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
        urlService: appLocator<UrlService>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        setTextScaleUseCase: appLocator<SetTextScaleUseCase>(),
        setThemeUseCase: appLocator<SetThemeUseCase>(),
        signOutUseCase: appLocator<SignOutUseCase>(),
        fetchTextScaleUseCase: appLocator<FetchTextScaleUseCase>(),
        fetchThemeUseCase: appLocator<FetchThemeUseCase>(),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.only(top: kToolbarHeight / 2),
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            shadowColor: Theme.of(context).indicatorColor,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                AppConstants.settingsTitle,
                style: AppFonts.normal30.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          body: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (BuildContext context, SettingsState state) {
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
                            AppConstants.darkTheme,
                            style: AppFonts.normal22.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Switch(
                            onChanged: (bool value) {
                              BlocProvider.of<SettingsBloc>(context).add(
                                SetThemeEvent(isDark: value),
                              );
                              SettingsWidget.of(context).changeTheme(value);
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
                            AppConstants.textScale,
                            style: AppFonts.normal22.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Slider(
                            value: state.textScale,
                            onChanged: (double value) {
                              BlocProvider.of<SettingsBloc>(context).add(
                                SetTextScaleEvent(textScale: value),
                              );
                              SettingsWidget.of(context).changeTextScale(value);
                            },
                            min: AppConstants.minScale,
                            max: AppConstants.maxScale,
                            divisions: AppConstants.divisions,
                            activeColor: Theme.of(context).indicatorColor,
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      text: AppConstants.signOutTitle,
                      handler: () => BlocProvider.of<SettingsBloc>(context).add(
                        SignOutEvent(),
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
                                    link: AppConstants.telegramLink,
                                  ),
                                ),
                              ),
                              AppButton(
                                text: AppConstants.instagramContactTitle,
                                handler: () =>
                                    BlocProvider.of<SettingsBloc>(context).add(
                                  OpenLinkEvent(
                                    link: AppConstants.instagramLink,
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
      ),
    );
  }
}
