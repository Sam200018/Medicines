
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository)
      : super(const AuthenticationState.unathenticated()) {
    on<AuthenticationUserChanged>(onAuthenticationUserChangedToState);
    on<AuthenticationLogoutRequested>(onAuthenticationLogoutToState);
  }

  void onAuthenticationUserChangedToState(
      AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    print("Cambio");
    emit(const AuthenticationState.authenticated());
  }

  void onAuthenticationLogoutToState(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    // TODO: delete token
    emit(const AuthenticationState.unathenticated());
  }
}
