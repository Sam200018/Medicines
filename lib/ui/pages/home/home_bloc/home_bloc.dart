import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicines/domain/entities/user.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthRepositoryImpl authRepositoryImpl;

  HomeBloc(this.authRepositoryImpl) : super(HomeChecking()) {
    on<HomeCheckingEvent>(onHomeCheckingToState);
    on<OutHome>(onOutHomeToState);
  }

  Future<void> onHomeCheckingToState(
      HomeCheckingEvent event, Emitter<HomeState> emit) async {
    var userJson = await authRepositoryImpl.getUser();
    var data = jsonDecode(userJson!);
    final user = User.fromJson(data);
    if (user.houseId == 0) {
      emit(NotAtHome());
    } else {
      emit(AtHome());
    }
  }

  Future<void> onOutHomeToState(OutHome event, Emitter<HomeState> emit) async {


  }
}
