part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();
}

class ShowQR extends QrEvent {
  @override
  List<Object?> get props => [];
}
