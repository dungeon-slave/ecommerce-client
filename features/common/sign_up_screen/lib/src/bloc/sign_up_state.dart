part of 'sign_up_bloc.dart';

class SignUpState {
  final bool isLoading;
  final String errorMessage;

  const SignUpState({
    this.isLoading = false,
    this.errorMessage = '',
  });

  SignUpState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
