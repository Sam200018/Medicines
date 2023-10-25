part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();
}

class QrInitial extends QrState {
  @override
  List<Object> get props => [];
}

class QRSuccess extends QrState {
  final String data;

  const QRSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class QRFailed extends QrState {
  final String message;

  const QRFailed({required this.message});

  @override
  List<Object?> get props => [message];
}