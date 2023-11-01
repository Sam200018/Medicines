import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:medicines/domain/entities/medicine.dart';
import 'package:medicines/domain/entities/user.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';
import 'package:medicines/infrastructure/repositories/home_repository_impl.dart';
import 'package:medicines/infrastructure/repositories/medicine_repository_impl.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthRepositoryImpl authRepositoryImpl;
  final HomeRepositoryImpl homeRepositoryImpl;
  final MedicineRepositoryImpl medicineRepositoryImpl;


  HomeBloc(this.authRepositoryImpl, this.homeRepositoryImpl, this.medicineRepositoryImpl)
      : super(const HomeChecking(null)) {
    on<HomeCheckingEvent>(onHomeCheckingToState);
    on<ExitHome>(onOutHomeToState);
    on<CreateHome>(onCreateHomeToState);
  }

  Future<void> onHomeCheckingToState(
      HomeCheckingEvent event, Emitter<HomeState> emit) async {
    var userJson = await authRepositoryImpl.getUser();
    var data = jsonDecode(userJson!);
    final user = User.fromJson(data);
    if (user.houseId == 0) {
      emit(NotAtHome(event.message, false, true));
    } else {
      final medicineListResponse = await medicineRepositoryImpl.getAllMedicines(user.houseId);
      emit(AtHome(event.message, false, true,medicineListResponse.medicines));
    }
  }

  Future<void> onOutHomeToState(ExitHome event, Emitter<HomeState> emit) async {
    emit(const HomeChecking(null));

    var userJson = await authRepositoryImpl.getUser();
    var data = jsonDecode(userJson!);
    var user = User.fromJson(data);

    try {
      final FormData formData = FormData.fromMap({"user_id": user.id});
      final homeResponse =
          await homeRepositoryImpl.exitHouse(formData, user.houseId);
      user = homeResponse.user;
      data = user.toJson();
      userJson = jsonEncode(data);
      authRepositoryImpl.saveUser(userJson);
      add(HomeCheckingEvent(homeResponse.message));
    } catch (e) {
      emit(AtHome(e.toString(), true, false, const []));
    }
  }

  Future<void> onCreateHomeToState(
      CreateHome event, Emitter<HomeState> emit) async {
    emit(const HomeChecking(null));
    var userJson = await authRepositoryImpl.getUser();
    var data = jsonDecode(userJson!);
    var user = User.fromJson(data);

    try {
      final FormData formData = FormData.fromMap(
          {"name": "Casa de ${user.name}", "user_id": user.id});
      final homeResponse = await homeRepositoryImpl.createHouse(formData);
      user = homeResponse.user;
      data = user.toJson();
      userJson = jsonEncode(data);
      authRepositoryImpl.saveUser(userJson);
      add(HomeCheckingEvent(homeResponse.message));
    } catch (e) {
      emit(NotAtHome(e.toString(), true, false));
    }
  }
}
