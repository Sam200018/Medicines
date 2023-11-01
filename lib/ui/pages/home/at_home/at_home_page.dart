import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/domain/entities/medicine.dart';
import 'package:medicines/ui/pages/home/at_home/widgets/medicine_list.dart';
import 'package:medicines/ui/pages/home/widgets/pills_drawer.dart';
import 'package:medicines/ui/pages/home/widgets/pills_floating_action_button.dart';
import 'package:medicines/ui/pages/login/widgets/pills_input.dart';

class AtHomePage extends StatelessWidget {
  final List<Medicine> medicines;

  const AtHomePage({super.key, required this.medicines});

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
      endDrawer: const PillsDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
            child: MedicineList(
          medicines: medicines,
        )),
      ),
      floatingActionButton: SizedBox(
        width: 180.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PillsFloatingActionButton(
              tooltip: "FAB 1",
              onPress: () {
                context.push(MedicinesRouter.addMember);
              },
              label: const Icon(Icons.qr_code),
            ),
            PillsFloatingActionButton(
              tooltip: "FAB 2",
              onPress: () {
                context.push("${MedicinesRouter.medicine}/");
              },
              label: const Icon(Icons.medical_services_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
