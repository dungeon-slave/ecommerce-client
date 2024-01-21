import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/src/bloc/settings/settings_bloc_bloc.dart';
import 'package:settings/src/ui/settings_content.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc(
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
        urlService: appLocator<UrlService>(),
        checkUserUseCase: appLocator<CheckUserRoleUseCase>(),
        setTextScaleUseCase: appLocator<SetTextScaleUseCase>(),
        setThemeUseCase: appLocator<SetThemeUseCase>(),
        signOutUseCase: appLocator<SignOutUseCase>(),
        fetchTextScaleUseCase: appLocator<FetchTextScaleUseCase>(),
        fetchThemeUseCase: appLocator<FetchThemeUseCase>(),
      ),
      child: const SettingsContent(),
    );
  }
}
