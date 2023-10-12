part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeCheckingEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class CreatingHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class JoinHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class OutHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}


