import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicines/ui/pages/utils/validators.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final firstNameCtrl = TextEditingController(),
      lastNameCtrl = TextEditingController(),
      emailCtrl = TextEditingController(),
      passwordCtrl = TextEditingController(),
      verifyPasswordCtrl = TextEditingController();

  SignupBloc() : super(SignupState.empty()) {
    on<NameChanged>(onNameChangedToState);
    on<LastNameChanged>(onLastNameChangedToState);
    on<EmailChanged>(onEmailChangedToState);
    on<PasswordChanged>(onPasswordChangedToState);
    on<VerifiedPasswordChanged>(onVerifiedPasswordChangedToState);
    on<SubmittingForm>(onSubmittingFormToState);
  }

  void onNameChangedToState(NameChanged event, Emitter<SignupState> emit) {
    if (firstNameCtrl.text.isEmpty) {
      emit(state.update(isNameValid: false, nameError: "Campo obligatorio"));
      return;
    }
    var isNameValid = Validators.isValidNames(firstNameCtrl.text);
    emit(state.update(
        isNameValid: isNameValid,
        nameError: (!isNameValid) ? "Nombre no valido" : ""));
  }

  void onLastNameChangedToState(
      LastNameChanged event, Emitter<SignupState> emit) {
    if (lastNameCtrl.text.isEmpty) {
      emit(state.update(
          isLastNameValid: false, lastNameError: "Campo obligatorio"));
      return;
    }
    var isLastNameValid = Validators.isValidNames(lastNameCtrl.text);

    emit(state.update(
        isLastNameValid: isLastNameValid,
        lastNameError: (!isLastNameValid) ? "Apellido no valido" : ""));
  }

  void onEmailChangedToState(EmailChanged event, Emitter<SignupState> emit) {
    if (emailCtrl.text.isEmpty) {
      emit(state.update(isEmailVal: false, emailError: "Campo obligatorio"));
      return;
    }

    var isEmailValid = Validators.isValidEmail(emailCtrl.text);
    emit(state.update(
        isEmailVal: isEmailValid,
        emailError: (!isEmailValid) ? "Email no valido" : ""));
  }

  void onPasswordChangedToState(
      PasswordChanged event, Emitter<SignupState> emit) {
    if (passwordCtrl.text.isEmpty) {
      emit(
          state.update(isPassValid: false, passwordError: "Campo obligatorio"));
      return;
    }
    emit(state.update(isPassValid: true, passwordError: ""));
  }

  void onVerifiedPasswordChangedToState(
      VerifiedPasswordChanged event, Emitter<SignupState> emit) {
    if (verifyPasswordCtrl.text.isEmpty) {
      emit(state.update(
          isVerPassEquals: false, verPasswordError: "Campo Obligatorio"));
    }

    var isVerPassEquals = passwordCtrl.text == verifyPasswordCtrl.text;
    emit(state.update(
        isVerPassEquals: isVerPassEquals,
        verPasswordError:
            (!isVerPassEquals) ? "Las contraseñas no coinciden" : ""));
  }

  Future onSubmittingFormToState(SubmittingForm event, Emitter<SignupState> emit) async {

  }
}
