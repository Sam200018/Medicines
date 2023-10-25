import 'package:flutter/cupertino.dart';
import 'package:medicines/ui/pages/home/widgets/pills_text_title.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PillsTextTitle(text: "Medicamentos"),
        SizedBox(height: 300.0,),
        Text("Ops! parace que no se han agregado medicamentos")
      ],
    );
  }
}
