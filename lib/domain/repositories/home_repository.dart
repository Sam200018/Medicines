import 'package:dio/dio.dart';
import 'package:medicines/domain/entities/home_response.dart';

abstract class HomeRepository {
  Future<HomeResponse> createHouse(FormData formData);

  Future<void> joinHouse(FormData formData);

  Future<HomeResponse> exitHouse(FormData formData,int houseId);
}
