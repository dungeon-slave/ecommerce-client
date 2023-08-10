import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart' show CheckUserUseCase;
import 'package:flutter/material.dart';
import 'package:main_page_screen/src/bloc/main_page_bloc.dart';
import 'package:navigation/navigation.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      lazy: false,
      child: const AutoRouter(),
    );
  }
}
