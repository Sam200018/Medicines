import 'package:go_router/go_router.dart';
import 'package:medicines/ui/pages/login/login_page.dart';
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
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => const SignupPage(),
      ),
    ],
  );
}
