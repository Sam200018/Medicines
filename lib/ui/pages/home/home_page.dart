import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';

import 'auth/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PillsButton(
        onPress: () {
          context.read<AuthBloc>().add(const LogoutRequested());
        },
        text: 'Salir',
        height: 50.0,
        color: mainButton,
      )),
    );
  }
}
