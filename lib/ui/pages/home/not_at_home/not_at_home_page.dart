import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/ui/pages/home/widgets/pills_button_icon.dart';

import '../home_bloc/home_bloc.dart';

class NotAtHomePage extends StatelessWidget {
  const NotAtHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          toolbarHeight: 70,
          title: Image.asset(
            "assets/logo_menu.png",
            scale: 2,
          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            PillsButtonIcon(
              onPress: () {
                context.read<HomeBloc>().add(CreateHome());
              },
              text: "Crear una casa",
              height: 100,
              color: createHouseButton,
              icon: Icons.home,
              iconSize: 70,
            ),
            const SizedBox(height: 20),
            PillsButtonIcon(
                onPress: () {},
                text: "Unirse a una casa",
                height: 100,
                color: joinHouseButton,
                icon: Icons.add_home_work_outlined,
                iconSize: 70)
          ],
        ),
      ),
    );
  }
}
