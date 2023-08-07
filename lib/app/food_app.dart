import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsBloc(
        setThemeUseCase: appLocator<SetThemeUseCase>(),
        fetchThemeUseCase: appLocator<FetchThemeUseCase>(),
        setTextScaleUseCase: appLocator<SetTextScaleUseCase>(),
        fetchTextScaleUseCase: appLocator<FetchTextScaleUseCase>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        signOutUseCase: appLocator<SignOutUseCase>(),
        urlService: appLocator<UrlService>(),
        authService: appLocator<AuthService>(),
        appRouter: appLocator<AppRouter>(),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return MaterialApp.router(
            routerConfig: appLocator<AppRouter>().config(
              reevaluateListenable: appLocator<AuthService>(),
            ),
            builder: (context, child) => MediaQuery(
              data: const MediaQueryData()
                  .copyWith(textScaleFactor: state.textScale),
              child: child ?? const SizedBox.shrink(),
            ),
            theme: state.isDark ? AppTheme.dark : AppTheme.light,
          );
        },
      ),
    );
  }
}
