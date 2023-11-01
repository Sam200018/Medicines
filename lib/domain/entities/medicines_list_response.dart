import 'dart:convert';

import 'package:medicines/domain/entities/medicine.dart';

class MedicinesListResponse {
  final List<Medicine> medicines;
  final String message;

  MedicinesListResponse({
    required this.medicines,
    required this.message,
  });

  MedicinesListResponse copyWith({
    List<Medicine>? medicines,
    String? message,
  }) =>
      MedicinesListResponse(
        medicines: medicines ?? this.medicines,
        message: message ?? this.message,
      );

  factory MedicinesListResponse.fromRawJson(String str) =>
      MedicinesListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicinesListResponse.fromJson(Map<String, dynamic> json) =>
      MedicinesListResponse(
        medicines: List<Medicine>.from(
            json["medicines"].map((x) => Medicine.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "medicines": List<dynamic>.from(medicines.map((x) => x.toJson())),
        "message": message,
      };
}
