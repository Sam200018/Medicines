import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicines/domain/datasources/auth_datasource.dart';
import 'package:medicines/domain/entities/auth_response.dart';
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
  Future<AuthResponse> login(FormData formData) => authDataSource.login(formData);

  @override
  Future<String?> getToken() => flutterSecureStorage.read(key: "Token");

  @override
  Future<void> saveToken(String token) =>
      flutterSecureStorage.write(key: "Token", value: token);



  @override
  Future<AuthResponse> checkStatus(String token, String email) =>
      authDataSource.checkStatus(token, email);


  @override
  Future<void> deleteToken() => flutterSecureStorage.delete(key: "Token");

  @override
  Future<String?> getUser() =>flutterSecureStorage.read(key: "User");

  @override
  Future<void> saveUser(String user)=> flutterSecureStorage.write(key: "User", value: user);

  @override
  Future<void> deleteUser()=> flutterSecureStorage.delete(key: "User");
}
