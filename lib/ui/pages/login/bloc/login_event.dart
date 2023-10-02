part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class EmailChanged extends LoginEvent {
  const EmailChanged();

  @override
  List<Object> get props => [];
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged();

  @override
  List<Object> get props => [];
}

class SubmittingForm extends LoginEvent {
  final VoidCallback authenticated;

  const SubmittingForm({required this.authenticated});

  @override
  List<Object> get props => [authenticated];
}
