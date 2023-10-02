import 'dart:convert';

import 'package:dio/dio.dart';

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
  Future<String> login(FormData formData) async {
    try {
      final response = await dio.request("login",
          options: Options(method: "Get"), data: formData);
      final data = jsonDecode(response.data);
      return data["token"];
    } catch (e) {
      rethrow;
    }
  }
}
