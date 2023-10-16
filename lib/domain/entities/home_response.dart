import 'dart:convert';

import 'package:medicines/domain/entities/user.dart';

class HomeResponse {
  final String message;
  final User user;

  HomeResponse({
    required this.message,
    required this.user,
  });

  HomeResponse copyWith({
    String? message,
    User? user,
  }) =>
      HomeResponse(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory HomeResponse.fromRawJson(String str) => HomeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
  };
}