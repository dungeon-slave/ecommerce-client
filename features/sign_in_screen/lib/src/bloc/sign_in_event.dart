part of 'sign_in_bloc.dart';

abstract class LoginScreenEvent {}

class EmailSignInEvent extends LoginScreenEvent {
  final EmailSignInModel model;

  EmailSignInEvent({required this.model});
}

class GoogleSignInEvent extends LoginScreenEvent {}
