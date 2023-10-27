part of 'medicine_bloc.dart';

abstract class MedicineEvent extends Equatable {
  const MedicineEvent();
}

class NameChanged extends MedicineEvent {
  @override
  List<Object?> get props => [];
}

class DoseChanged extends MedicineEvent {
  @override
  List<Object?> get props => [];
}

class AmountChanged extends MedicineEvent {
  @override
  List<Object?> get props => [];
}

class DateChanged extends MedicineEvent {
  @override
  List<Object?> get props => [];
}

class CompoundsChanged extends MedicineEvent {
  @override
  List<Object?> get props => [];
}

class SubmittedForm extends MedicineEvent {
  final VoidCallback returnToHome;

  const SubmittedForm({required this.returnToHome});

  @override
  List<Object?> get props => [returnToHome];
}
