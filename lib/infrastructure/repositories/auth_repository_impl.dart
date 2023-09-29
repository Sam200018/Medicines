import 'package:dio/dio.dart';
import 'package:medicines/domain/datasources/auth_datasource.dart';
import 'package:medicines/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<String> signup(FormData formData) => authDataSource.signup(formData);
}
