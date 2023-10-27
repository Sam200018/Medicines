
import 'dart:convert';

class Medicine {
  final int? id;
  final String name;
  final num dose;
  final num amountAvailable;
  final DateTime dueDate;
  final String activeCompounds;
  final int houseId;

  Medicine({
    required this.id,
    required this.name,
    required this.dose,
    required this.amountAvailable,
    required this.dueDate,
    required this.activeCompounds,
    required this.houseId,
  });

  Medicine copyWith({
    int? id,
    String? name,
    double? dose,
    double? amountAvailable,
    DateTime? dueDate,
    String? activeCompounds,
    int? houseId,
  }) =>
      Medicine(
        id: id ?? this.id,
        name: name ?? this.name,
        dose: dose ?? this.dose,
        amountAvailable: amountAvailable ?? this.amountAvailable,
        dueDate: dueDate ?? this.dueDate,
        activeCompounds: activeCompounds ?? this.activeCompounds,
        houseId: houseId ?? this.houseId,
      );

  factory Medicine.fromRawJson(String str) => Medicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json["ID"],
    name: json["name"],
    dose: json["dose"],
    amountAvailable: json["amountAvailable"],
    dueDate: DateTime.parse(json["dueDate"]),
    activeCompounds: json["activeCompounds"],
    houseId: json["houseId"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "name": name,
    "dose": dose,
    "amountAvailable": amountAvailable,
    "dueDate": dueDate.toIso8601String(),
    "activeCompounds": activeCompounds,
    "houseId": houseId,
  };
}
