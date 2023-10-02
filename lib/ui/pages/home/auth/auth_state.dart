part of 'auth_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;


  const AuthenticationState._({
    required this.status,
  });

  const AuthenticationState.unknown()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.authenticated()
      : this._(status: AuthenticationStatus.authenticated, );

  const AuthenticationState.unathenticated()
      : this._(status: AuthenticationStatus.unauthenticated);


  @override
  List<Object> get props => [status];
}