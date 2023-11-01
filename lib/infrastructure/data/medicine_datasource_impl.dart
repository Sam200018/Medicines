import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:medicines/domain/entities/medicines_list_response.dart';
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

  @override
  Future<MedicineResponse> deleteMedicine(int medicineId) {
    // TODO: implement deleteMedicine
    throw UnimplementedError();
  }

  @override
  Future<MedicinesListResponse> getAllMedicines(int houseId) async {
    try {
      final response = await dio.request("api/get-all-medicines/$houseId",
          options: Options(method: "GET"));
      final data = jsonDecode(response.data);
      final medicineListResponse = MedicinesListResponse.fromJson(data);
      return medicineListResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MedicineResponse> updateMedicine(
      FormData formData, int medicineID) async {
    try {
      final response = await dio.request("api/update-medicine/$medicineID",
          data: formData,
          options: Options(method: "PUT"));
      final data = jsonDecode(response.data);
      final medicineResponse = MedicineResponse.fromJson(data);
      return medicineResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MedicineResponse> getMedicineById(String medicineId) async {
    try {
      final response = await dio.request("api/get-medicine/$medicineId",
          options: Options(method: "GET"));
      final data = jsonDecode(response.data);
      final medicineResponse = MedicineResponse.fromJson(data);
      return medicineResponse;
    } catch (e) {
      rethrow;
    }
  }
}
