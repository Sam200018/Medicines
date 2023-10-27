import 'dart:convert';

import 'medicine.dart';

class MedicineResponse {
  final Medicine medicine;
  final String message;

  MedicineResponse({
    required this.medicine,
    required this.message,
  });

  MedicineResponse copyWith({
    Medicine? medicine,
    String? message,
  }) =>
      MedicineResponse(
        medicine: medicine ?? this.medicine,
        message: message ?? this.message,
      );

  factory MedicineResponse.fromRawJson(String str) => MedicineResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicineResponse.fromJson(Map<String, dynamic> json) => MedicineResponse(
    medicine: Medicine.fromJson(json["medicine"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "medicine": medicine.toJson(),
    "message": message,
  };
}