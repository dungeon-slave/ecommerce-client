part of 'sign_in_bloc.dart';

class SignInState {
  final bool isLoading;
  final String errorMessage;

  const SignInState({
    this.isLoading = false,
    this.errorMessage = '',
  });

  SignInState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
