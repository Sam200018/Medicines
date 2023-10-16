part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final bool? isFailure;
  final bool? isSuccess;
  final String? message;

  const HomeState(this.message,
      {this.isFailure = false, this.isSuccess = false});
}

class HomeChecking extends HomeState {
  const HomeChecking(String? message) : super(message);

  @override
  List<Object> get props => [];
}

class AtHome extends HomeState {
  const AtHome(String? message, bool? isFailure, bool? isSuccess)
      : super(message, isSuccess: isSuccess, isFailure: isFailure);

  @override
  List<Object> get props => [];
}

class NotAtHome extends HomeState {
  const NotAtHome(String? message, bool? isFailure, bool? isSuccess)
      : super(message, isFailure: isFailure, isSuccess: isSuccess);

  @override
  List<Object> get props => [];
}
