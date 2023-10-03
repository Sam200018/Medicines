import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(const AuthState.unathenticated()) {
    on<UserChanged>(onAuthenticationUserChangedToState);
    on<LogoutRequested>(onAuthenticationLogoutToState);
    on<CheckStatus>(onCheckStatusToState);
  }

  void onAuthenticationUserChangedToState(
      UserChanged event, Emitter<AuthState> emit) {
    emit(const AuthState.authenticated());
  }

  void onAuthenticationLogoutToState(
      LogoutRequested event, Emitter<AuthState> emit) {
    authRepository.deleteToken();
    authRepository.deleteEmail();
    emit(const AuthState.unathenticated());
  }

  Future<void> onCheckStatusToState(
      CheckStatus event, Emitter<AuthState> emit) async {
    var token = await authRepository.getToken();
    if (token == null) {
      emit(const AuthState.unathenticated());
    } else {
      try {
        var email = await authRepository.getEmail();
        var updatedToken = await authRepository.checkStatus(token, email!);
        authRepository.saveToken(updatedToken);
        emit(const AuthState.authenticated());
      } catch (e) {
        authRepository.deleteEmail();
        authRepository.deleteToken();
        emit(const AuthState.unathenticated());
      }
    }
  }
}
