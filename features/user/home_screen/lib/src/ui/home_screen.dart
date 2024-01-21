import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core/services/network_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/src/bloc/home_screen_bloc.dart';
import 'package:home_screen/src/ui/home_content.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenBloc(
        fetchCartCountUseCase: appLocator<FetchCartCountUseCase>(),
        networkService: appLocator<NetworkService>(),
        fetchTextScaleUseCase: appLocator<FetchTextScaleUseCase>(),
        fetchThemeUseCase: appLocator<FetchThemeUseCase>(),
      ),
      child: const HomeContent(),
    );
  }
}
