import 'package:dio/dio.dart';
import 'package:medicines/domain/entities/medicine_response.dart';

abstract class MedicineRepository {
  Future<MedicineResponse> saveMedicine(FormData formData);
}