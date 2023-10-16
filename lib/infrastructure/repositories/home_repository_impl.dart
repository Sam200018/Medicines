import 'package:dio/src/form_data.dart';
import 'package:medicines/domain/datasources/home_datasource.dart';
import 'package:medicines/domain/entities/home_response.dart';

import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<HomeResponse> createHouse(FormData formData) =>
      homeDataSource.createHouse(formData);

  @override
  Future<HomeResponse> exitHouse(FormData formData, int houseId) =>
      homeDataSource.exitHouse(formData, houseId);

  @override
  Future<void> joinHouse(FormData formData) {
    // TODO: implement exitHouse
    throw UnimplementedError();
  }
}
