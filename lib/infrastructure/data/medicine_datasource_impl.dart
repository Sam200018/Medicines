import 'dart:convert';
import 'package:dio/dio.dart';
import '../../domain/datasources/medicine_datasource.dart';
import '../../domain/entities/medicine_response.dart';

class MedicineDataSourceImpl implements MedicineDataSource {
  final Dio dio;

  MedicineDataSourceImpl(this.dio);

  @override
  Future<MedicineResponse> saveMedicine(FormData formData) async {
    try {
      final response = await dio.request("api/create-medicine",
          data: formData, options: Options(method: "POST"));
      final data = jsonDecode(response.data);
      final medicineResponse = MedicineResponse.fromJson(data);
      return medicineResponse;
    } catch (e) {
      rethrow;
    }
  }
}
