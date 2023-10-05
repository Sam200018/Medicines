import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/repositories/auth_repository.dart';
import '../../utils/validators.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final emailCtrl = TextEditingController(),
      passwordCtrl = TextEditingController();

  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginState.empty()) {
    on<EmailChanged>(onEmailChangedToState);
    on<PasswordChanged>(onPasswordChangedToState);
    on<SubmittingForm>(onSubmittingFormToState);
  }

  void onEmailChangedToState(EmailChanged event, Emitter<LoginState> emit) {
    if (emailCtrl.text.isEmpty) {
      emit(state.update(isEmailValid: false, emailError: "Campo obligatorio"));
      return;
    }
    var isEmailValid = Validators.isValidEmail(emailCtrl.text);
    emit(state.update(
        isEmailValid: isEmailValid,
        emailError: (!isEmailValid) ? "Nombre no valido" : ""));
  }

  void onPasswordChangedToState(
      PasswordChanged event, Emitter<LoginState> emit) {
    if (passwordCtrl.text.isEmpty) {
      emit(state.update(
          isPasswordValid: false, passwordError: "Campo obligatorio"));
      return;
    }
    emit(state.update(isPasswordValid: true, passwordError: ""));
  }

  Future<void> onSubmittingFormToState(
      SubmittingForm event, Emitter<LoginState> emit) async {
    emit(LoginState.loading());
    try {
      FormData formData = FormData.fromMap({
        "email": emailCtrl.text,
        "password": passwordCtrl.text,
      });
      var authResponse = await authRepository.login(formData);
      if (authResponse.token.isNotEmpty) {
        authRepository.saveToken(authResponse.token);
        final userMap = authResponse.user.toJson();

        String userJson = jsonEncode(userMap);

        authRepository.saveUser(userJson);

        emit(LoginState.success());
        event.authenticated();
      }
    } catch (e) {
      emit(LoginState.failure(e.toString()));
    }
  }
}
