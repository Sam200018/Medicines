import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicines/domain/entities/user.dart';

import '../../../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(const AuthState.unknown()) {
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
    authRepository.deleteUser();
    emit(const AuthState.unathenticated());
  }

  Future<void> onCheckStatusToState(
      CheckStatus event, Emitter<AuthState> emit) async {
    emit(const AuthState.unknown());

    var token = await authRepository.getToken();

    if (token == null) {
      emit(const AuthState.unathenticated());
    } else {
      try {
        var userJson = await authRepository.getUser();
        var data = jsonDecode(userJson!);
        final user = User.fromJson(data);

        var authResponse = await authRepository.checkStatus(token, user.email);

        authRepository.saveToken(authResponse.token);

        data = authResponse.user.toJson();
        userJson = jsonEncode(data);
        authRepository.saveUser(userJson);

        emit(const AuthState.authenticated());
      } catch (e) {
        authRepository.deleteUser();
        authRepository.deleteToken();
        emit(const AuthState.unathenticated());
      }
    }
  }
}
