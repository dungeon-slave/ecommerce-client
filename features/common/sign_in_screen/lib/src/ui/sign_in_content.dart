import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_screen/sign_in_screen.dart';

class SignInContent extends StatelessWidget {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  const SignInContent({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final SignInBloc signInBloc = BlocProvider.of<SignInBloc>(context);

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: themeData.scaffoldBackgroundColor,
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (_, SignInState state) {
              if (state.errorMessage.isNotEmpty) {
                SnackBarService.show(
                  context: context,
                  title: state.errorMessage,
                );
              }
            },
            builder: (_, SignInState state) {
              if (state.isLoading) {
                return const AppLoadingCircle();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: constraints.minHeight / 18),
                    child: Text(
                      AppStrConstants.signInPageTitle,
                      style: AppFonts.normal30.copyWith(
                        color: themeData.primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: constraints.minWidth / 14,
                      right: constraints.minWidth / 14,
                      bottom: constraints.minHeight / 60,
                    ),
                    child: AppTextField(
                      textController: _emailController,
                      label: AppStrConstants.emailTitle,
                      isObscure: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: constraints.minWidth / 14,
                      right: constraints.minWidth / 14,
                      bottom: constraints.minHeight / 15,
                    ),
                    child: AppTextField(
                      textController: _passwordController,
                      label: AppStrConstants.passwordTitle,
                      isObscure: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: constraints.minHeight / 60),
                    width: constraints.minWidth / 1.15,
                    height: constraints.minHeight / 20,
                    child: AppButton(
                      text: AppStrConstants.emailSignInTitle,
                      handler: () {
                        signInBloc.add(
                          EmailSignInEvent(
                            model: EmailSignInModel(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: constraints.minHeight / 60),
                    child: SizedBox(
                      width: constraints.minWidth / 1.15,
                      height: constraints.minHeight / 20,
                      child: AppButton(
                        text: AppStrConstants.googleSignInTitle,
                        handler: () => signInBloc.add(GoogleSignInEvent()),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: constraints.minWidth / 1.15,
                    height: constraints.minHeight / 20,
                    child: AppButton(
                      text: AppStrConstants.signUpPageTitle,
                      handler: () => signInBloc.add(SignUpNavigateEvent()),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
