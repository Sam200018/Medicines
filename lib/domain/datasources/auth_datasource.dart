import 'package:dio/src/form_data.dart';

abstract class AuthDataSource {
  Future<String> signup(FormData formData);

  Future<String> login(FormData formData);

  Future<String> checkStatus(String token, String email);
}
