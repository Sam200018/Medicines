import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/ui/pages/home/home_bloc/home_bloc.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';
import 'package:medicines/ui/pages/login/widgets/pills_datepicker.dart';
import 'package:medicines/ui/pages/login/widgets/pills_input.dart';
import 'package:medicines/ui/pages/login/widgets/pills_text_input.dart';

import '../login/widgets/pills_snackbar.dart';
import 'bloc/medicine_bloc.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicineBloc, MedicineState>(
      listener: (context, state) {
        if (state.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(PillsSnackbar(
              message: state.message,
              backgroundColor: Colors.green,
            ));
        }
        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(PillsSnackbar(
              message: state.message,
            ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Agregar un medicamento"),
        ),
        body: BlocBuilder<MedicineBloc, MedicineState>(
          builder: (context, state) {
            if (state.isSubmitting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    PillsInput(
                      textController: context.read<MedicineBloc>().nameCtrl,
                      textInputType: TextInputType.text,
                      labelText: "Nombre del medicamento",
                      errorText: state.nameError,
                      onChanged: (name) {
                        context.read<MedicineBloc>().add(NameChanged());
                      },
                    ),
                    const SizedBox(height: 20.0),
                    PillsTextInput(
                      label: "Dosis: ",
                      unit: "gr/ml",
                      textController: context.read<MedicineBloc>().doseCtrl,
                      errorText: state.doseError,
                      onChanged: (dose) {
                        context.read<MedicineBloc>().add(DoseChanged());
                      },
                    ),
                    const SizedBox(height: 20.0),
                    PillsTextInput(
                      label: "Disponible: ",
                      unit: "",
                      textController: context.read<MedicineBloc>().amountCtrl,
                      errorText: state.amountError,
                      onChanged: (amount) {
                        context.read<MedicineBloc>().add(AmountChanged());
                      },
                    ),
                    const SizedBox(height: 20.0),
                    PillsDatePicker(
                      ctrl: context.read<MedicineBloc>().dateCtrl,
                      onTap: () async {
                        DateTime? pickedTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 4));

                        if (pickedTime != null) {
                          final formattedDate =
                              DateFormat("dd-MM-yyyy").format(pickedTime);
                          context.read<MedicineBloc>().dateCtrl.text =
                              formattedDate;
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                    PillsInput(
                      textController:
                          context.read<MedicineBloc>().compoundsCtrl,
                      textInputType: TextInputType.text,
                      labelText: "Compuestos activos",
                      minLines: 3,
                      maxLines: 5,
                      errorText: state.compoundsError,
                      onChanged: (compounds) {
                        context.read<MedicineBloc>().add(CompoundsChanged());
                      },
                    ),
                    const SizedBox(height: 40.0),
                    PillsButton(
                        onPress: () {
                          context.read<MedicineBloc>().add(SubmittedForm(
                            returnToHome: () {
                              context.pop();
                              context.read<HomeBloc>().add(const HomeCheckingEvent(null));
                            },
                          ));
                        },
                        text: "Guardar",
                        height: 40,
                        color: mainButton)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
