part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthEvent {


  const AuthenticationUserChanged();

  @override
  List<Object> get props => [];
}

class AuthenticationLogoutRequested extends AuthEvent {


  const AuthenticationLogoutRequested();

  @override
  List<Object> get props => [];
}