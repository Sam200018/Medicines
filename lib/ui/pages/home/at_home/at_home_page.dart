import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';

import '../home_bloc/home_bloc.dart';

class AtHomePage extends StatelessWidget {
  const AtHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PillsButton(
          onPress: () {
            context.read<HomeBloc>().add(OutHome());
          },
          text: "Salirse de la casa",
          height: 40,
          color: mainButton,
        ),
      ),
    );
  }
}
