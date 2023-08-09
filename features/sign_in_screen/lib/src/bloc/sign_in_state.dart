part of 'sign_in_bloc.dart';

class LoginScreenState {
  final String errorMessage;

  const LoginScreenState({
    required this.errorMessage,
  });

  LoginScreenState copyWith({
    String? errorMessage,
  }) {
    return LoginScreenState(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
