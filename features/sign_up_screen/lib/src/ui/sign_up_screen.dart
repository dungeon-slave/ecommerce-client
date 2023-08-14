import 'package:core/core.dart' show BlocConsumer, BlocProvider, RoutePage;
import 'package:core/di/app_di.dart';
import 'package:core/services/auth_service.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:sign_up_screen/src/bloc/sign_up_bloc.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
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
      create: (context) => SignUpBloc(
        emailSignUpUseCase: appLocator<EmailSignUpUseCase>(),
        saveUserUseCase: appLocator<SaveUserUseCase>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      child: Scaffold(
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (BuildContext context, SignUpState state) {
            if (state.errorMessage.isNotEmpty) {
              showAppSnackBar(context: context, title: state.errorMessage);
            }
          },
          builder: (BuildContext context, SignUpState state) {
            if (state.isLoading) {
              return const AppLoadingCircle();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: kToolbarHeight / 1.2),
                  child: Text(
                    AppConstants.signUpPageTitle,
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
                    label: AppConstants.emailTitle,
                    textController: _emailController,
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
                    label: AppConstants.passwordTitle,
                    textController: _passwordController,
                    isObscure: true,
                  ),
                ),
                SizedBox(
                  width: kToolbarHeight * 6,
                  height: kToolbarHeight / 1.3,
                  child: AppButton(
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
