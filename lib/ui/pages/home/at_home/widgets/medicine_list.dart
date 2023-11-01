import 'package:flutter/cupertino.dart';
import 'package:medicines/domain/entities/medicine.dart';
import 'package:medicines/ui/pages/home/at_home/widgets/medicine_item.dart';
import 'package:medicines/ui/pages/home/widgets/pills_text_title.dart';

class MedicineList extends StatelessWidget {
  final List<Medicine> medicines;

  const MedicineList({super.key, required this.medicines});

  @override
  Widget build(BuildContext context) {
    if (medicines.isEmpty) {
      return const Column(
        children: [
          PillsTextTitle(text: "Medicamentos"),
          SizedBox(
            height: 300.0,
          ),
          Text("Ops! parace que no se han agregado medicamentos")
        ],
      );
    }

    return Column(
      children: [
        const PillsTextTitle(text: "Medicamentos"),
        SizedBox(
          height: 650,
          child: ListView.builder(
            itemCount: medicines.length,
            itemBuilder: (context, index) =>
                MedicineItem(medicineItem: medicines[index]),
          ),
        )
      ],
    );
  }
}
