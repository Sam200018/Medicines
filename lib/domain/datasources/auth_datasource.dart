import 'package:dio/dio.dart';
import 'package:medicines/domain/entities/auth_response.dart';

abstract class AuthDataSource {
  Future<String> signup(FormData formData);

  Future<AuthResponse> login(FormData formData);

  Future<AuthResponse> checkStatus(String token, String email);
}
