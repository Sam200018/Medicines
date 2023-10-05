import 'dart:convert';

class User {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final int houseId;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.houseId,
  });

  User copyWith({
    int? id,
    String? name,
    String? lastName,
    String? email,
    int? houseId,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        houseId: houseId ?? this.houseId,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["ID"],
    name: json["name"],
    lastName: json["last_name"],
    email: json["email"],
    houseId: json["house_id"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "name": name,
    "last_name": lastName,
    "email": email,
    "house_id": houseId,
  };
}
