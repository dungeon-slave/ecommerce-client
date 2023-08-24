import 'package:core/core.dart'
    show AuthService, BlocConsumer, BlocProvider, RoutePage;
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:sign_in_screen/sign_in_screen.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInBloc(
        emailSignInUseCase: appLocator<EmailSignInUseCase>(),
        googleSignInUseCase: appLocator<GoogleSignInUseCase>(),
        saveUserUseCase: appLocator<SaveUserUseCase>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: BlocConsumer<SignInBloc, SignInState>(
              listener: (BuildContext context, SignInState state) {
                if (state.errorMessage.isNotEmpty) {
                  showAppSnackBar(context: context, title: state.errorMessage);
                }
              },
              builder: (BuildContext context, SignInState state) {
                if (state.isLoading) {
                  return const AppLoadingCircle();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(bottom: constraints.minHeight / 18),
                      child: Text(
                        AppStrConstants.signInPageTitle,
                        style: AppFonts.normal30.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
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
                    Container(
                      margin: EdgeInsets.only(
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
                      margin:
                          EdgeInsets.only(bottom: constraints.minHeight / 60),
                      width: constraints.minWidth / 1.15,
                      height: constraints.minHeight / 20,
                      child: AppButton(
                        text: AppStrConstants.emailSignInTitle,
                        handler: () {
                          BlocProvider.of<SignInBloc>(context).add(
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
                    Container(
                      margin:
                          EdgeInsets.only(bottom: constraints.minHeight / 60),
                      width: constraints.minWidth / 1.15,
                      height: constraints.minHeight / 20,
                      child: AppButton(
                        text: AppStrConstants.googleSignInTitle,
                        handler: () => BlocProvider.of<SignInBloc>(context).add(
                          GoogleSignInEvent(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.minWidth / 1.15,
                      height: constraints.minHeight / 20,
                      child: AppButton(
                        text: AppStrConstants.signUpPageTitle,
                        handler: () => BlocProvider.of<SignInBloc>(context).add(
                          SignUpNavigateEvent(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
