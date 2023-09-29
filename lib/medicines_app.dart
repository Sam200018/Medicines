import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/config/theme/theme.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';
import 'package:medicines/ui/pages/signup/Bloc/signup_bloc.dart';

class MedicinesApp extends StatelessWidget {
  const MedicinesApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(
            create: (context) =>
                SignupBloc(context.read<AuthRepositoryImpl>())),
      ],
      child: MaterialApp.router(
        title: "Medicines",
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: MedicinesRouter().router,
      ),
    );
  }
}
