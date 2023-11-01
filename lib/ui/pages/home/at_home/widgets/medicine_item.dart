import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/domain/entities/medicine.dart';

class MedicineItem extends StatelessWidget {
  final Medicine medicineItem;

  const MedicineItem({super.key, required this.medicineItem});

  @override
  Widget build(BuildContext context) {
    final dueDate = DateFormat("dd-MM-yyyy").format(medicineItem.dueDate);

    return Card(
      child: ListTile(
        title: Text(medicineItem.name),
        subtitle: Column(
          children: [
            Text("Cantidad: ${medicineItem.amountAvailable}"),
            Text("Fecha de caducidad: $dueDate"),
          ],
        ),
        onTap: () {
          context.push("${MedicinesRouter.medicine}/${medicineItem.id}");
        },
      ),
    );
  }
}
