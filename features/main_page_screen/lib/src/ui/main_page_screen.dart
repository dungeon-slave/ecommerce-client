import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart' show CheckUserUseCase;
import 'package:flutter/material.dart';
import 'package:main_page_screen/src/bloc/main_page_bloc.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
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
      child: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          return state.isChecked ? const AutoRouter() : const AppLoadingCircle();
        },
      ),
    );
  }
}
