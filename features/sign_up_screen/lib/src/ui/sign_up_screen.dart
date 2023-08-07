import 'package:core/core.dart' show BlocBuilder, BlocProvider, RoutePage;
import 'package:core/di/app_di.dart';
import 'package:core/services/auth_service.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:sign_up_screen/src/bloc/sign_up_bloc.dart';

//FIXME make adaptive layout
@RoutePage()
class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        emailSignUpUseCase: appLocator<EmailSignUpUseCase>(),
        saveUserUseCase: appLocator<SaveUserUseCase>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConstants.signUpTitle,
              style: AppFonts.normal30.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: AppDimens.padding25,
                right: AppDimens.padding25,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: AppConstants.emailTitle,
                ),
                controller: _emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: AppDimens.padding25,
                right: AppDimens.padding25,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: AppConstants.passwordTitle,
                ),
                controller: _passwordController,
              ),
            ),
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return AppButton(
                  text: AppConstants.createAccount,
                  handler: () => BlocProvider.of<SignUpBloc>(context).add(
                    SignUpEvent(
                      data: EmailSignUpModel(
                        name: '',
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}