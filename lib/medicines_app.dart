import 'package:flutter/material.dart';
import 'package:medicines/config/router/router.dart';

class MedicinesApp extends StatelessWidget {
  const MedicinesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Medicines",
      debugShowCheckedModeBanner: false,
      routerConfig: MedicinesRouter().router,
    );
  }
}
