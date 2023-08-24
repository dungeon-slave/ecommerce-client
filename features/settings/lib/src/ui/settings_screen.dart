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
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SafeArea(
            minimum: EdgeInsets.only(top: constraints.minHeight / 28),
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    AppStrConstants.settingsTitle,
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
                                AppStrConstants.darkTheme,
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
                                AppStrConstants.textScale,
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
                                  SettingsWidget.of(context)
                                      .changeTextScale(value);
                                },
                                min: AppNumConstants.minScale,
                                max: AppNumConstants.maxScale,
                                divisions: AppNumConstants.divisions,
                                activeColor: Theme.of(context).indicatorColor,
                              ),
                            ],
                          ),
                        ),
                        AppButton(
                          text: AppStrConstants.signOutTitle,
                          handler: () => BlocProvider.of<SettingsBloc>(context)
                              .add(SignOutEvent()),
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
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <AppButton>[
                                  AppButton(
                                    text: AppStrConstants.telegramContactTitle,
                                    handler: () =>
                                        BlocProvider.of<SettingsBloc>(context)
                                            .add(
                                      OpenLinkEvent(
                                        link: AppStrConstants.telegramLink,
                                      ),
                                    ),
                                  ),
                                  AppButton(
                                    text: AppStrConstants.instagramContactTitle,
                                    handler: () =>
                                        BlocProvider.of<SettingsBloc>(context)
                                            .add(
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
      ),
    );
  }
}
