import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicines/infrastructure/repositories/medicine_repository_impl.dart';

import '../../../../domain/entities/user.dart';
import '../../../../infrastructure/repositories/auth_repository_impl.dart';

part 'medicine_event.dart';

part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final nameCtrl = TextEditingController();
  final doseCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final compoundsCtrl = TextEditingController();

  final AuthRepositoryImpl authRepositoryImpl;
  final MedicineRepositoryImpl medicineRepositoryImpl;

  MedicineBloc(this.authRepositoryImpl, this.medicineRepositoryImpl)
      : super(MedicineState.initial()) {
    on<NameChanged>(onNameChangedToState);
    on<DoseChanged>(onDoseChangedToState);
    on<AmountChanged>(onAmountChangedToState);
    on<DateChanged>(onDateChangedToState);
    on<CompoundsChanged>(onCompoundsToState);
    on<SubmittedForm>(onSubmittedFormToState);
  }

  void onNameChangedToState(NameChanged event, Emitter<MedicineState> emit) {
    if (nameCtrl.text.isEmpty) {
      emit(state.update(isNameValid: false, nameError: "Campo obligatorio"));
      return;
    }
    emit(state.update(isNameValid: true, nameError: ""));
  }

  void onDoseChangedToState(DoseChanged event, Emitter<MedicineState> emit) {
    if (doseCtrl.text.isEmpty) {
      emit(state.update(isDoseValid: false, doseError: "Campo obligatorio"));
      return;
    }
    emit(state.update(isDoseValid: true, doseError: ""));
  }

  void onAmountChangedToState(
      AmountChanged event, Emitter<MedicineState> emit) {
    if (amountCtrl.text.isEmpty) {
      emit(
          state.update(isAmountValid: false, amountError: "Campo obligatorio"));
      return;
    }
    emit(state.update(isAmountValid: true, amountError: ""));
  }

  void onDateChangedToState(DateChanged event, Emitter<MedicineState> emit) {
    // if(amountCtrl.text.isEmpty){
    //   emit(
    //     state.update()
    //   )
    // }
    print("Date");
  }

  void onCompoundsToState(CompoundsChanged event, Emitter<MedicineState> emit) {
    if (compoundsCtrl.text.isEmpty) {
      emit(state.update(
          isCompoundsValid: false, compoundsError: "Campo obligatorio"));
      return;
    }
    emit(state.update(isCompoundsValid: true, compoundsError: ""));
  }

  Future<void> onSubmittedFormToState(
      SubmittedForm event, Emitter<MedicineState> emit) async {
    emit(MedicineState.submitting());
    try {
      var userJson = await authRepositoryImpl.getUser();
      var data = jsonDecode(userJson!);
      var user = User.fromJson(data);

      FormData formData = FormData.fromMap({
        "name": nameCtrl.text,
        "dose": doseCtrl.text,
        "amountAvailable": amountCtrl.text,
        "dueDate": dateCtrl.text,
        "activeCompounds": compoundsCtrl.text,
        "houseId": user.houseId
      });
      final medicineResponse =
          await medicineRepositoryImpl.saveMedicine(formData);
      emit(MedicineState.success(medicineResponse.message));
      event.returnToHome();
    } catch (e) {
      emit(MedicineState.failure(e.toString()));
    }
  }
}
