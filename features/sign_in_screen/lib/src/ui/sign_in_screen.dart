import 'package:core/core.dart'
    show AuthService, AutoRouterX, BlocBuilder, BlocProvider, RoutePage;
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:sign_in_screen/sign_in_screen.dart';
import 'package:sign_up_screen/sign_up_screen.gm.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(
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
            Container(
              margin: const EdgeInsets.only(bottom: kToolbarHeight / 1.2),
              child: Text(
                AppConstants.signInPageTitle,
                style: AppFonts.normal30.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: kToolbarHeight / 2,
                right: kToolbarHeight / 2,
                bottom: kToolbarHeight / 5,
              ),
              child: AppTextField(
                textController: _emailController,
                label: AppConstants.emailTitle,
                isObscure: false,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: kToolbarHeight / 2,
                right: kToolbarHeight / 2,
                bottom: kToolbarHeight,
              ),
              child: AppTextField(
                textController: _passwordController,
                label: AppConstants.passwordTitle,
                isObscure: true,
              ),
            ),
            BlocBuilder<SignInBloc, LoginScreenState>(
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.only(bottom: kToolbarHeight / 5),
                  width: kToolbarHeight * 6,
                  height: kToolbarHeight / 1.3,
                  child: AppButton(
                    text: AppConstants.emailSignInTitle,
                    handler: () {
                      BlocProvider.of<SignInBloc>(context).add(
                        EmailSignInEvent(
                          model: EmailSignInModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      );
                      if (state.errorMessage.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.errorMessage,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
            BlocBuilder<SignInBloc, LoginScreenState>(
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.only(bottom: kToolbarHeight / 5),
                  width: kToolbarHeight * 6,
                  height: kToolbarHeight / 1.3,
                  child: AppButton(
                    text: AppConstants.googleSignInTitle,
                    handler: () => BlocProvider.of<SignInBloc>(context).add(
                      GoogleSignInEvent(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: kToolbarHeight * 6,
              height: kToolbarHeight / 1.3,
              child: AppButton(
                text: AppConstants.signUpPageTitle,
                handler: () => context.router.push(SignUpRoute()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
