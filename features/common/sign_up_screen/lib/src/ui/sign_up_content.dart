import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/authentication/email_sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:sign_up_screen/sign_up_screen.dart';

class SignUpContent extends StatelessWidget {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  const SignUpContent({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignUpBloc signUpBloc = BlocProvider.of<SignUpBloc>(context);

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return Scaffold(
          body: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (_, SignUpState state) {
              if (state.errorMessage.isNotEmpty) {
                SnackBarService.show(
                  context: context,
                  title: state.errorMessage,
                );
              }
            },
            builder: (_, SignUpState state) {
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
                      AppStrConstants.signUpPageTitle,
                      style: AppFonts.normal30.copyWith(
                        color: theme.primaryColor,
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
                      label: AppStrConstants.emailTitle,
                      textController: _emailController,
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
                      label: AppStrConstants.passwordTitle,
                      textController: _passwordController,
                      isObscure: true,
                    ),
                  ),
                  SizedBox(
                    width: constraints.minWidth / 1.15,
                    height: constraints.minHeight / 20,
                    child: AppButton(
                      text: AppStrConstants.createAccount,
                      handler: () => signUpBloc.add(
                        SignUpEvent(
                          data: EmailSignUpModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      ),
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
