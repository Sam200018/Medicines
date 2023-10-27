
import 'package:dio/dio.dart';
import 'package:medicines/domain/datasources/medicine_datasource.dart';
import 'package:medicines/domain/entities/medicine_response.dart';

import '../../domain/repositories/medicine_repository.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineDataSource medicineDataSource;

  MedicineRepositoryImpl({required this.medicineDataSource});

  @override
  Future<MedicineResponse> saveMedicine(FormData formData) =>
      medicineDataSource.saveMedicine(formData);
}
