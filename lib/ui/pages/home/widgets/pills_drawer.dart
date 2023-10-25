import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';

import '../auth/auth_bloc.dart';
import '../home_bloc/home_bloc.dart';

class PillsDrawer extends StatelessWidget {
  const PillsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Image.asset("assets/logo_menu.png")),
          PillsButton(
              onPress: () {
                context.read<HomeBloc>().add(ExitHome());
              },
              text: "Abandonar casa",
              height: 40.0,
              color: Colors.transparent),
          const SizedBox(height: 10),
          PillsButton(
              onPress: () {
                context.read<AuthBloc>().add(const LogoutRequested());
              },
              text: "Cerrar sesion",
              height: 40.0,
              color: Colors.transparent),
        ],
      ),
    );
  }
}
