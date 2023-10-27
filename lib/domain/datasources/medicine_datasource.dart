import 'package:dio/dio.dart';
import 'package:medicines/domain/entities/medicine_response.dart';

abstract class MedicineDataSource {
  Future<MedicineResponse> saveMedicine(FormData formData);
}
