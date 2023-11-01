import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';
import 'package:medicines/ui/pages/login/widgets/pills_input.dart';
import 'package:medicines/ui/pages/login/widgets/pills_snackbar.dart';
import 'package:medicines/ui/pages/login/widgets/pills_text_button.dart';
import 'package:medicines/ui/pages/signup/widgets/mini_logo_pills.dart';

import 'Bloc/signup_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: PillsTextButton(
              text: "Ya tengo cuenta",
              fontSize: 20.0,
              onPress: () {
                context.go(MedicinesRouter.login);
              },
            ),
          ),
          body: BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(PillsSnackbar(message: state.errorMessage));
              }
              if (state.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    PillsSnackbar(
                      message: "Usuario creado",
                      backgroundColor: Colors.green,
                    ),
                  );
                context.go(MedicinesRouter.login);
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    const MiniLogoPills(),
                    const SizedBox(height: 20),
                    PillsInput(
                      textController: context.read<SignupBloc>().firstNameCtrl,
                      textInputType: TextInputType.name,
                      labelText: "Nombre",
                      errorText: state.nameError,
                      onChanged: (name) {
                        context.read<SignupBloc>().add(const NameChanged());
                      },
                    ),
                    const SizedBox(height: 20),
                    PillsInput(
                      textController: context.read<SignupBloc>().lastNameCtrl,
                      textInputType: TextInputType.name,
                      labelText: "Apellido",
                      errorText: state.lastNameError,
                      onChanged: (lastName) {
                        context.read<SignupBloc>().add(const LastNameChanged());
                      },
                    ),
                    const SizedBox(height: 20),
                    PillsInput(
                      textController: context.read<SignupBloc>().emailCtrl,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Email",
                      errorText: state.emailError,
                      onChanged: (email) {
                        context.read<SignupBloc>().add(const EmailChanged());
                      },
                    ),
                    const SizedBox(height: 20),
                    PillsInput(
                      textController: context.read<SignupBloc>().passwordCtrl,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Password",
                      obscureText: true,
                      errorText: state.passwordError,
                      maxLines: 1,
                      minLines: 1,
                      onChanged: (password) {
                        context.read<SignupBloc>().add(const PasswordChanged());
                      },
                    ),
                    const SizedBox(height: 20),
                    PillsInput(
                      textController:
                          context.read<SignupBloc>().verifyPasswordCtrl,
                      textInputType: TextInputType.emailAddress,
                      obscureText: true,
                      labelText: "Confirmar password",
                      errorText: state.verPasswordError,
                      maxLines: 1,
                      minLines: 1,
                      onChanged: (verPassword) {
                        context
                            .read<SignupBloc>()
                            .add(const VerifiedPasswordChanged());
                      },
                    ),
                    const SizedBox(height: 20),
                    PillsButton(
                      onPress: isSignupButtonEnable(state, context)
                          ? () {
                              context
                                  .read<SignupBloc>()
                                  .add(const SubmittingForm());
                            }
                          : null,
                      text: "Crear cuenta",
                      height: 60,
                      color: mainButton,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool isSignupButtonEnable(SignupState state, BuildContext context) {
    final bloc = context.read<SignupBloc>();

    return state.isFormValid &&
        !state.isFailure &&
        !state.isSubmitting &&
        bloc.firstNameCtrl.text.isNotEmpty &&
        bloc.lastNameCtrl.text.isNotEmpty &&
        bloc.passwordCtrl.text.isNotEmpty &&
        bloc.verifyPasswordCtrl.text.isNotEmpty;
  }
}
