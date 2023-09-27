import 'package:flutter/material.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';
import 'package:medicines/ui/pages/login/widgets/pills_image.dart';
import 'package:medicines/ui/pages/login/widgets/pills_input.dart';
import 'package:medicines/ui/pages/login/widgets/pills_text_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: PillsTextButton(
          text: "Crear una nueva cuenta",
          fontSize: 20.0,
          onPress: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const LogoPills(),
              PillsInput(
                textController: TextEditingController(),
                textInputType: TextInputType.emailAddress,
                labelText: "Email",
                errorText: "",
              ),
              const SizedBox(height: 16),
              PillsInput(
                  textController: TextEditingController(),
                  textInputType: TextInputType.text,
                  obscureText: true,
                  labelText: "Password",
                  errorText: ""),
              const SizedBox(height: 12),
              Row(
                children: [
                  PillsTextButton(
                      text: "Reestablecer contreseña",
                      fontSize: 15.0,
                      onPress: () {}),
                ],
              ),
              const SizedBox(height: 32),
              PillsButton(
                color: mainButton,
                onPress: (true) ? () {} : null,
                text: "Iniciar sesion",
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
