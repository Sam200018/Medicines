import 'package:dio/dio.dart';
import 'package:medicines/domain/entities/medicine_response.dart';
import 'package:medicines/domain/entities/medicines_list_response.dart';

abstract class MedicineRepository {
  Future<MedicineResponse> saveMedicine(FormData formData);
  Future<MedicineResponse> deleteMedicine(int medicineId);
  Future<MedicinesListResponse> getAllMedicines(int houseId);
  Future<MedicineResponse> updateMedicine(FormData formData,int medicineID);
  Future<MedicineResponse> getMedicineById(String medicineId);
}