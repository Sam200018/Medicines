import 'package:dio/src/form_data.dart';

abstract class AuthRepository {
  Future<String> signup(FormData formData);
}
