import 'package:dio/src/form_data.dart';

import '../entities/auth_response.dart';

abstract class AuthRepository {
  Future<String> signup(FormData formData);

  Future<AuthResponse> login(FormData formData);

  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> deleteToken();

  Future<void> saveUser(String user);

  Future<String?> getUser();

  Future<void> deleteUser();

  Future<AuthResponse> checkStatus(String token, String email);
}
