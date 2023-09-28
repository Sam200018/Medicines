part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class NameChanged extends SignupEvent {
  const NameChanged();

  @override
  List<Object> get props => [];
}

class LastNameChanged extends SignupEvent {
  const LastNameChanged();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignupEvent {
  const EmailChanged();

  @override
  List<Object> get props => [];
}

class PasswordChanged extends SignupEvent {
  const PasswordChanged();

  @override
  List<Object> get props => [];
}

class VerifiedPasswordChanged extends SignupEvent {
  const VerifiedPasswordChanged();

  @override
  List<Object?> get props => [];
}

class SubmittingForm extends SignupEvent {
  const SubmittingForm();

  @override
  List<Object> get props => [];
}
