import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';
import 'package:medicines/ui/pages/login/widgets/pills_input.dart';

import '../home_bloc/home_bloc.dart';

class AtHomePage extends StatelessWidget {
  const AtHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 30.0,
          child: PillsInput(
              textController: TextEditingController(),
              textInputType: TextInputType.text,
              labelText: "Buscar",
              errorText: ""),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: PillsButton(
            onPress: () {
              context.read<HomeBloc>().add(ExitHome());
            },
            text: "Salirse de la casa",
            height: 40,
            color: mainButton,
          ),
        ),
      ),
    );
  }
}
