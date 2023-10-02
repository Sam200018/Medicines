import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicines/domain/datasources/auth_datasource.dart';
import 'package:medicines/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final FlutterSecureStorage flutterSecureStorage;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.flutterSecureStorage,
  });

  @override
  Future<String> signup(FormData formData) => authDataSource.signup(formData);

  @override
  Future<String> login(FormData formData) => authDataSource.login(formData);

  @override
  Future<String?> getToken() => flutterSecureStorage.read(key: "Token");

  @override
  Future<void> saveToken(String token) =>
      flutterSecureStorage.write(key: "Token", value: token);

  @override
  Future<String?> getEmail() => flutterSecureStorage.read(key: "Email");

  @override
  Future<void> saveEmail(String email) =>
      flutterSecureStorage.write(key: "Email", value: email);
}
