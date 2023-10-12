part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeChecking extends HomeState {
  @override
  List<Object> get props => [];
}

class AtHome extends HomeState {
  @override
  List<Object> get props => [];
}

class NotAtHome extends HomeState {
  @override
  List<Object> get props => [];
}
