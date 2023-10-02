import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';
import 'package:medicines/ui/pages/login/bloc/login_bloc.dart';
import 'package:medicines/ui/pages/login/login_page.dart';
import 'package:medicines/ui/pages/signup/Bloc/signup_bloc.dart';
import 'package:medicines/ui/pages/signup/signup_page.dart';

class MedicinesRouter {
  static String home = "/";
  static String login = "/login";
  static String signup = "/signup";

  GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context.read<AuthRepositoryImpl>()),
            child: const LoginPage(),
          ),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(context.read<AuthRepositoryImpl>()),
          child: const SignupPage(),
        ),
      ),
    ],
  );
}
