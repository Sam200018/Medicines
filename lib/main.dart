import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:medicines/config/constants/environment.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';
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
        RepositoryProvider<AuthDataSourceImpl>(
          create: (context) => AuthDataSourceImpl(context.read<Dio>()),
        ),
        RepositoryProvider<AuthRepositoryImpl>(
          create: (context) =>
              AuthRepositoryImpl(context.read<AuthDataSourceImpl>()),
        ),
      ],
      child: const MedicinesApp(),
    ),
  );
}
