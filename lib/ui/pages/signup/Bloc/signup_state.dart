part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final bool isNameValid,
      isLastNameValid,
      isEmailVal,
      isPassValid,
      isVerPassEquals,
      isSubmitting,
      isSuccess,
      isFailure;

  final String nameError,
      lastNameError,
      emailError,
      passwordError,
      verPasswordError,
      errorMessage;

  const SignupState({
    this.isNameValid = true,
    this.isLastNameValid = true,
    this.isEmailVal = true,
    this.isPassValid = true,
    this.isVerPassEquals = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.nameError = "",
    this.lastNameError = "",
    this.emailError = "",
    this.passwordError = "",
    this.verPasswordError = "",
    this.errorMessage = "",
  });

  bool get isFormValid =>
      isNameValid && isLastNameValid && isEmailVal && isPassValid && isVerPassEquals;

  @override
  List<Object?> get props => [
        isNameValid,
        isLastNameValid,
        isEmailVal,
        isPassValid,
        isVerPassEquals,
        isSubmitting,
        isSuccess,
        isFailure,
        nameError,
        lastNameError,
        emailError,
        passwordError,
        verPasswordError,
        errorMessage
      ];

  factory SignupState.empty() {
    return const SignupState();
  }

  factory SignupState.loading() {
    return const SignupState(
      isSubmitting: true,
    );
  }

  factory SignupState.success() {
    return const SignupState(isSuccess: true);
  }

  factory SignupState.failure(String errorMessage) {
    return SignupState(isFailure: true, errorMessage: errorMessage);
  }

  SignupState copyWith(
      {bool? isNameValid,
      bool? isLastNameValid,
      bool? isEmailVal,
      bool? isPassValid,
      bool? isVerPassEquals,
      bool? isSubmitting,
      bool? isSuccess,
      bool? isFailure,
      String? nameError,
      String? lastNameError,
      String? emailError,
      String? passwordError,
      String? verPasswordError,
      String? errorMessage}) {
    return SignupState(
      isNameValid: isNameValid ?? this.isNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isEmailVal: isEmailVal ?? this.isEmailVal,
      isPassValid: isPassValid ?? this.isPassValid,
      isVerPassEquals: isVerPassEquals ?? this.isVerPassEquals,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isFailure: isFailure ?? this.isFailure,
      isSuccess: isSuccess ?? this.isSuccess,
      nameError: nameError ?? this.nameError,
      lastNameError: lastNameError ?? this.lastNameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      verPasswordError: verPasswordError ?? this.verPasswordError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  SignupState update(
      {bool? isNameValid,
      bool? isLastNameValid,
      bool? isEmailVal,
      bool? isPassValid,
      bool? isVerPassEquals,
      String? nameError,
      String? lastNameError,
      String? emailError,
      String? passwordError,
      String? verPasswordError,
      String? errorMessage}) {
    return copyWith(
      isNameValid: isNameValid,
      isLastNameValid: isLastNameValid,
      isEmailVal: isEmailVal,
      isPassValid: isPassValid,
      isVerPassEquals: isVerPassEquals,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
      nameError: nameError,
      lastNameError: lastNameError,
      emailError: emailError,
      passwordError: passwordError,
      verPasswordError: verPasswordError,
      errorMessage: errorMessage,
    );
  }
}
