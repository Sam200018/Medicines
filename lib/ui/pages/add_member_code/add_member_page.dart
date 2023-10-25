import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'bloc/qr_bloc.dart';

class AddMemberPage extends StatelessWidget {
  const AddMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        if (state is QRSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Agregar miembro"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(

                children: [
                  QrImageView(
                    data: state.data,
                    version: QrVersions.auto,
                    size: 400,
                  ),
                  Text("Muestra este codigo QR a la persona que quieras agregar a tu casa")
                ],
              ),
            ),
          );
        }
        if (state is QRFailed) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Agregar miembro"),
            ),
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text("Agregar miembro"),
            ),
            body: const CircularProgressIndicator());
      },
    );
  }
}
