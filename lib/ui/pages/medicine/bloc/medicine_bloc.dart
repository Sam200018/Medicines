import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:medicines/domain/entities/medicine.dart';
import 'package:medicines/domain/entities/medicine_response.dart';
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
  Medicine? medicine;

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
    on<LoadMedicine>(onLoadMedicine);
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
      final MedicineResponse response;


      if (medicine != null) {

        response =
            await medicineRepositoryImpl.updateMedicine(formData, medicine!.id!);
      } else {
        response = await medicineRepositoryImpl.saveMedicine(formData);
      }
      emit(MedicineState.success(response.message));
      event.returnToHome();
    } catch (e) {
      emit(MedicineState.failure(e.toString()));
    }
  }

  Future<void> onLoadMedicine(
      LoadMedicine event, Emitter<MedicineState> emit) async {
    emit(MedicineState.submitting());
    try {
      final medicineResponse =
          await medicineRepositoryImpl.getMedicineById(event.id);

      medicine = medicineResponse.medicine;
      nameCtrl.text = medicine!.name;
      doseCtrl.text = medicine!.dose.toString();
      amountCtrl.text = medicine!.amountAvailable.toString();

      final formattedDate = DateFormat("dd-MM-yyyy").format(medicine!.dueDate);
      dateCtrl.text = formattedDate;
      compoundsCtrl.text = medicine!.activeCompounds;
      emit(MedicineState.success(medicineResponse.message));
    } catch (e) {
      emit(MedicineState.failure(e.toString()));
    }
  }
}
