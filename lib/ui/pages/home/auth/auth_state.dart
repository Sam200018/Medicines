part of 'auth_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthState extends Equatable {
  final AuthenticationStatus status;


  const AuthState._({
    required this.status,
  });

  const AuthState.unknown()
      : this._(status: AuthenticationStatus.unknown);

  const AuthState.authenticated()
      : this._(status: AuthenticationStatus.authenticated, );

  const AuthState.unathenticated()
      : this._(status: AuthenticationStatus.unauthenticated);


  @override
  List<Object> get props => [status];
}