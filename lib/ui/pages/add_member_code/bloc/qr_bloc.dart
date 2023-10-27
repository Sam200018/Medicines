import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';

import '../../../../domain/entities/user.dart';

part 'qr_event.dart';

part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  final AuthRepositoryImpl authRepositoryImpl;

  QrBloc(this.authRepositoryImpl) : super(QrInitial()) {
    on<ShowQR>(onShowQRToState);
  }

  Future<void> onShowQRToState(ShowQR event, Emitter<QrState> emit) async {
    try {
      var userJson = await authRepositoryImpl.getUser();
      var data = jsonDecode(userJson!);
      final user = User.fromJson(data);
      emit(QRSuccess(data: user.houseId.toString()));
    } catch (e) {
      emit(const QRFailed(message: "Lo siento, no es posible mostar QR ahora"));
    }
  }
}
