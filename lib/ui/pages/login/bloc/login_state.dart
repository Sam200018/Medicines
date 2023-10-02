part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isEmailValid, isPasswordValid, isSubmitting, isSuccess, isFailure;
  final String emailError, passwordError, message;

  const LoginState({
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.message = "",
    this.emailError = "",
    this.passwordError = "",
  });

  bool get isFormValid => isEmailValid && isPasswordValid;

  @override
  List<Object?> get props => [
        isEmailValid,
        isPasswordValid,
        isSubmitting,
        isSuccess,
        isFailure,
        message,
        emailError,
        passwordError,
      ];

  factory LoginState.empty() {
    return const LoginState();
  }

  factory LoginState.loading() {
    return const LoginState(isSubmitting: true);
  }

  factory LoginState.failure(String message) {
    return LoginState(isFailure: true, message: message);
  }

  factory LoginState.success() {
    return const LoginState(isSuccess: true, message: "Login exitoso");
  }

  LoginState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? message,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }

  LoginState update({
    bool? isEmailValid,
    bool? isPasswordValid,
    String? emailError,
    String? passwordError,
    String? message,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      emailError: emailError,
      passwordError: passwordError,
      message: message,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }
}
