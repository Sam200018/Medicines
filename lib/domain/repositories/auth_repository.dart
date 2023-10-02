import 'package:dio/src/form_data.dart';

abstract class AuthRepository {
  Future<String> signup(FormData formData);

  Future<String> login(FormData formData);

  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> saveEmail(String email);

  Future<String?> getEmail();
}
