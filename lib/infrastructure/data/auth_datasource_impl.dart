import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:medicines/domain/entities/auth_response.dart';

import '../../domain/datasources/auth_datasource.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio;

  AuthDataSourceImpl(this.dio);

  @override
  Future<String> signup(FormData formData) async {
    try {
      final response = await dio.request("createUser",
          options: Options(method: "POST"), data: formData);
      final data = jsonDecode(response.data);
      return data["message"];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse> login(FormData formData) async {
    try {
      final response = await dio.request("login",
          options: Options(method: "GET"), data: formData);
      final data = jsonDecode(response.data);
      final authResponse = AuthResponse.fromJson(data);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse> checkStatus(String token, String email) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      final FormData formData = FormData.fromMap({"email": email});

      final response = await dio.request("api/check-status",
          options: Options(method: "GET"), data: formData);
      final data = jsonDecode(response.data);
      final authResponse = AuthResponse.fromJson(data);
      print(authResponse.token);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }
}
