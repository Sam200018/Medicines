import 'package:flutter/material.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/config/theme/theme.dart';

class MedicinesApp extends StatelessWidget {
  const MedicinesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Medicines",
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: MedicinesRouter().router,
    );
  }
}
