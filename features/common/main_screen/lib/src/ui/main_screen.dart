import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart' show CheckUserRoleUseCase;
import 'package:domain/usecase/text_scale/fetch_text_scale_usecase.dart';
import 'package:domain/usecase/theme/fetch_theme_usecase.dart';
import 'package:flutter/material.dart';
import 'package:main_screen/src/bloc/main_screen_bloc.dart';
import 'package:main_screen/src/ui/main_content.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainScreenBloc(
        checkUserUseCase: appLocator<CheckUserRoleUseCase>(),
        fetchTextScaleUseCase: appLocator<FetchTextScaleUseCase>(),
        fetchThemeUseCase: appLocator<FetchThemeUseCase>(),
        authService: appLocator<AuthService>(),
      ),
      child: const MainContent(),
    );
  }
}
