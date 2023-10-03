import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/config/theme/theme.dart';
import 'package:medicines/ui/pages/home/auth/auth_bloc.dart';

import 'infrastructure/repositories/auth_repository_impl.dart';

class MedicinesApp extends StatelessWidget {
  const MedicinesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(context.read<AuthRepositoryImpl>())
        ..add(const CheckStatus()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          FlutterNativeSplash.remove();
          return MaterialApp.router(
            title: "Medicines",
            debugShowCheckedModeBanner: false,
            theme: AppTheme().getTheme(),
            routerConfig: MedicinesRouter().router,
          );
        },
      ),
    );
  }
}
