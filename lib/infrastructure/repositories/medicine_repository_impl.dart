import 'package:dio/dio.dart';
import 'package:medicines/domain/datasources/medicine_datasource.dart';
import 'package:medicines/domain/entities/medicine_response.dart';
import 'package:medicines/domain/entities/medicines_list_response.dart';

import '../../domain/repositories/medicine_repository.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineDataSource medicineDataSource;

  MedicineRepositoryImpl({required this.medicineDataSource});

  @override
  Future<MedicineResponse> saveMedicine(FormData formData) =>
      medicineDataSource.saveMedicine(formData);

  @override
  Future<MedicineResponse> deleteMedicine(int medicineId) {
    // TODO: implement deleteMedicine
    throw UnimplementedError();
  }

  @override
  Future<MedicinesListResponse> getAllMedicines(int houseId) =>
      medicineDataSource.getAllMedicines(houseId);

  @override
  Future<MedicineResponse> updateMedicine(FormData formData, int medicineID) =>
      medicineDataSource.updateMedicine(formData, medicineID);

  @override
  Future<MedicineResponse> getMedicineById(String medicineId) =>
      medicineDataSource.getMedicineById(medicineId);
}
