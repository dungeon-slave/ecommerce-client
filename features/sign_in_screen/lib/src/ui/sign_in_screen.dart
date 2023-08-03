import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:sign_in_screen/sign_in_screen.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenBloc(
        emailSignInUseCase: appLocator<EmailSignInUseCase>(),
        googleSignInUseCase: appLocator<GoogleSignInUseCase>(),
        saveUserUseCase: appLocator<SaveUserUseCase>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppConstants.signInTitle,
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
            BlocBuilder<LoginScreenBloc, LoginScreenState>(
              builder: (context, state) {
                return AppButton(
                  text: AppConstants.signInTitle,
                  handler: () => BlocProvider.of<LoginScreenBloc>(context).add(
                    EmailSignInEvent(
                      model: EmailSignInModel(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<LoginScreenBloc, LoginScreenState>(
              builder: (context, state) {
                return AppButton(
                  text: AppConstants.googleSignInTitle,
                  handler: () => BlocProvider.of<LoginScreenBloc>(context).add(
                    GoogleSignInEvent(),
                  ),
                );
              },
            ),
            AppButton(
              text: AppConstants.signUpTitle,
              handler: () => context.navigateTo(
                SignUpRoute(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
