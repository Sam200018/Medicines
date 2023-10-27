part of 'medicine_bloc.dart';

class MedicineState extends Equatable {
  final bool isNameValid,
      isDoseValid,
      isAmountValid,
      isCompoundsValid,
      isSubmitting,
      isSuccess,
      isFailure;

  final String nameError, doseError, amountError, compoundsError, message;

  const MedicineState({
    this.isNameValid = true,
    this.isDoseValid = true,
    this.isAmountValid = true,
    this.isCompoundsValid = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.nameError = "",
    this.doseError = "",
    this.amountError = "",
    this.compoundsError = "",
    this.message = "",
  });

  @override
  List<Object?> get props => [
        isNameValid,
        isDoseValid,
        isAmountValid,
        isCompoundsValid,
        isSubmitting,
        isSuccess,
        isFailure,
        nameError,
        doseError,
        amountError,
        compoundsError,
        message
      ];

  factory MedicineState.initial() {
    return const MedicineState();
  }

  factory MedicineState.submitting() {
    return const MedicineState(isSubmitting: true);
  }

  factory MedicineState.failure(String message) {
    return MedicineState(isFailure: true, message: message);
  }

  factory MedicineState.success(String message) {
    return MedicineState(isSuccess: true, message: message);
  }

  MedicineState copyWith(
      {bool? isNameValid,
      bool? isDoseValid,
      bool? isAmountValid,
      bool? isCompoundsValid,
      bool? isSubmitting,
      bool? isSuccess,
      bool? isFailure,
      String? nameError,
      String? doseError,
      String? amountError,
      String? compoundsError,
      String? message}) {
    return MedicineState(
      isNameValid: isNameValid ?? this.isNameValid,
      isDoseValid: isDoseValid ?? this.isDoseValid,
      isAmountValid: isAmountValid ?? this.isAmountValid,
      isCompoundsValid: isCompoundsValid ?? this.isCompoundsValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      nameError: nameError ?? this.nameError,
      doseError: doseError ?? this.doseError,
      amountError: amountError ?? this.amountError,
      compoundsError: compoundsError ?? this.compoundsError,
      message: message ?? this.message,
    );
  }

  MedicineState update({
    bool? isNameValid,
    bool? isDoseValid,
    bool? isAmountValid,
    bool? isCompoundsValid,
    String? nameError,
    String? doseError,
    String? amountError,
    String? compoundsError,
    String? message,
  }) {
    return copyWith(
      isNameValid: isNameValid,
      isDoseValid: isDoseValid,
      isAmountValid: isAmountValid,
      isCompoundsValid: isCompoundsValid,
      nameError: nameError,
      doseError: doseError,
      amountError: amountError,
      compoundsError: compoundsError,
      message: message,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }
}
