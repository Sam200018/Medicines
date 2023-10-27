import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicines/config/constants/environment.dart';
import 'package:medicines/infrastructure/data/home_datasource_impl.dart';
import 'package:medicines/infrastructure/data/medicine_datasource_impl.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';
import 'package:medicines/infrastructure/repositories/home_repository_impl.dart';
import 'package:medicines/infrastructure/repositories/medicine_repository_impl.dart';
import 'package:medicines/medicines_app.dart';

import 'infrastructure/data/auth_datasource_impl.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(
          create: (context) => Dio(
            BaseOptions(
              baseUrl: Environment.baseUrl,
            ),
          ),
        ),
        RepositoryProvider<FlutterSecureStorage>(
            create: (context) => const FlutterSecureStorage()),
        RepositoryProvider<AuthDataSourceImpl>(
          create: (context) => AuthDataSourceImpl(context.read<Dio>()),
        ),
        RepositoryProvider<AuthRepositoryImpl>(
          create: (context) => AuthRepositoryImpl(
            authDataSource: context.read<AuthDataSourceImpl>(),
            flutterSecureStorage: context.read<FlutterSecureStorage>(),
          ),
        ),
        RepositoryProvider<HomeDataSourceImp>(
          create: (context) => HomeDataSourceImp(context.read<Dio>()),
        ),
        RepositoryProvider<HomeRepositoryImpl>(
          create: (context) => HomeRepositoryImpl(
              homeDataSource: context.read<HomeDataSourceImp>()),
        ),
        RepositoryProvider<MedicineDataSourceImpl>(
          create: (context) => MedicineDataSourceImpl(context.read<Dio>()),
        ),
        RepositoryProvider<MedicineRepositoryImpl>(
          create: (context) => MedicineRepositoryImpl(
            medicineDataSource: context.read<MedicineDataSourceImpl>(),
          ),
        ),
      ],
      child: const MedicinesApp(),
    ),
  );
}
