import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/config/theme/theme.dart';
import 'package:medicines/ui/pages/signup/Bloc/signup_bloc.dart';

class MedicinesApp extends StatelessWidget {
  const MedicinesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
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
