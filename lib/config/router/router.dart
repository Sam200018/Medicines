import 'package:go_router/go_router.dart';
import 'package:medicines/ui/pages/login/login_page.dart';

class MedicinesRouter {
  static String home = "/";
  static String login = "/login";

  GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
