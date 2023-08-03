import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:sign_up_screen/src/bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final _nameController = TextEditingController();
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
                  labelText: AppConstants.nameTitle,
                ),
                controller: _nameController,
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
                        name: _nameController.text,
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
