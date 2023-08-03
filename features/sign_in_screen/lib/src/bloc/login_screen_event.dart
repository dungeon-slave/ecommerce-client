part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent {}

class EmailSignInEvent extends LoginScreenEvent {
  final EmailSignInModel model;

  EmailSignInEvent({required this.model});
}

class GoogleSignInEvent extends LoginScreenEvent {}

class EmailSignUpEvent extends LoginScreenEvent {
  final EmailSignUpModel model;

  EmailSignUpEvent({required this.model});
}
