import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:medicines/domain/datasources/home_datasource.dart';

import '../../domain/entities/home_response.dart';

class HomeDataSourceImp implements HomeDataSource {
  final Dio dio;

  HomeDataSourceImp(this.dio);

  @override
  Future<HomeResponse> createHouse(FormData formData) async {
    try {
      final response = await dio.request("api/create-house",
          data: formData, options: Options(method: "POST"));
      final data = jsonDecode(response.data);
      final homeResponse = HomeResponse.fromJson(data);
      return homeResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HomeResponse> exitHouse(FormData formData, int houseId) async {
    try {
      final response = await dio.request("api/exit-house/$houseId",
          data: formData, options: Options(method: "DELETE"));
      final data = jsonDecode(response.data);
      final homeResponse = HomeResponse.fromJson(data);
      return homeResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> joinHouse(FormData formData) {
    // TODO: implement joinHouse
    throw UnimplementedError();
  }
}
