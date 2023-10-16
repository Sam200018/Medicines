part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeCheckingEvent extends HomeEvent {
  final String message;

  const HomeCheckingEvent(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class JoinHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ExitHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}
