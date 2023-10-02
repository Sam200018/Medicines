import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicines/config/constants/colors.dart';
import 'package:medicines/config/router/router.dart';
import 'package:medicines/ui/pages/login/widgets/pills_button.dart';
import 'package:medicines/ui/pages/login/widgets/pills_image.dart';
import 'package:medicines/ui/pages/login/widgets/pills_input.dart';
import 'package:medicines/ui/pages/login/widgets/pills_snackbar.dart';
import 'package:medicines/ui/pages/login/widgets/pills_text_button.dart';

import '../home/auth/auth_bloc.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: PillsTextButton(
              text: "Crear una nueva cuenta",
              fontSize: 20.0,
              onPress: () {
                context.push(MedicinesRouter.signup);
              },
            ),
          ),
          body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    PillsSnackbar(
                      message: state.message,
                    ),
                  );
              }
              if (state.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    PillsSnackbar(
                      message: state.message,
                      backgroundColor: Colors.green,
                    ),
                  );
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const LogoPills(),
                    PillsInput(
                      textController: context.read<LoginBloc>().emailCtrl,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Email",
                      errorText: state.emailError,
                      onChanged: (email) {
                        context.read<LoginBloc>().add(const EmailChanged());
                      },
                    ),
                    const SizedBox(height: 16),
                    PillsInput(
                      textController: context.read<LoginBloc>().passwordCtrl,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      labelText: "Password",
                      errorText: state.passwordError,
                      onChanged: (password) {
                        context.read<LoginBloc>().add(const PasswordChanged());
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        PillsTextButton(
                          text: "Reestablecer contreseña",
                          fontSize: 15.0,
                          onPress: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    PillsButton(
                      color: mainButton,
                      onPress: isLoginButtonEnable(state, context)
                          ? () {
                              context
                                  .read<LoginBloc>()
                                  .add(SubmittingForm(authenticated: () {
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthenticationUserChanged());
                              }));
                            }
                          : null,
                      text: "Iniciar sesion",
                      height: 60,
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

  bool isLoginButtonEnable(LoginState state, BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return state.isFormValid &&
        !state.isFailure &&
        bloc.emailCtrl.text.isNotEmpty;
  }
}
