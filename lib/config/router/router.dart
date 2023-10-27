import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicines/config/router/router_notifier.dart';
import 'package:medicines/infrastructure/repositories/auth_repository_impl.dart';
import 'package:medicines/infrastructure/repositories/home_repository_impl.dart';
import 'package:medicines/infrastructure/repositories/medicine_repository_impl.dart';
import 'package:medicines/ui/pages/Loading/loading_page.dart';
import 'package:medicines/ui/pages/add_member_code/add_member_page.dart';
import 'package:medicines/ui/pages/add_member_code/bloc/qr_bloc.dart';
import 'package:medicines/ui/pages/home/auth/auth_bloc.dart';
import 'package:medicines/ui/pages/home/home_bloc/home_bloc.dart';
import 'package:medicines/ui/pages/login/bloc/login_bloc.dart';
import 'package:medicines/ui/pages/login/login_page.dart';
import 'package:medicines/ui/pages/medicine/bloc/medicine_bloc.dart';
import 'package:medicines/ui/pages/read_code/read_code_page.dart';
import 'package:medicines/ui/pages/signup/Bloc/signup_bloc.dart';
import 'package:medicines/ui/pages/signup/signup_page.dart';

import '../../ui/pages/home/home_page.dart';
import '../../ui/pages/medicine/medicine_page.dart';

class MedicinesRouter {
  static String home = "/";
  static String login = "/login";
  static String signup = "/signup";
  static String loading = "/loading";
  static String addMember = "/add_member";
  static String readCode = "/read_code";
  static String medicine = "/medicine";

  GoRouter router = GoRouter(
      initialLocation: loading,
      refreshListenable: AuthStateNotifier(),
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
        GoRoute(
          path: home,
          builder: (context, state) => BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              context.read<AuthRepositoryImpl>(),
              context.read<HomeRepositoryImpl>(),
            )..add(const HomeCheckingEvent("Checking...")),
            child: const HomePage(),
          ),
        ),
        GoRoute(
            path: loading, builder: (context, state) => const LoadingPage()),
        GoRoute(
          path: addMember,
          builder: (context, state) => BlocProvider<QrBloc>(
            create: (context) => QrBloc(
              context.read<AuthRepositoryImpl>(),
            )..add(ShowQR()),
            child: const AddMemberPage(),
          ),
        ),
        GoRoute(
            path: readCode,
            builder: (context, state) {
              return const ReadCodePage();
            }),
        GoRoute(
          path: medicine,
          builder: (context, state) {
            return BlocProvider<MedicineBloc>(
              create: (context) {
                return MedicineBloc(
                  context.read<AuthRepositoryImpl>(),
                  context.read<MedicineRepositoryImpl>(),
                );
              },
              child: const MedicinePage(),
            );
          },
        ),
      ],
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        var authStatus = context.read<AuthBloc>().state.status;

        if (isGoingTo == loading &&
            authStatus == AuthenticationStatus.unknown) {
          return null;
        }

        if (authStatus == AuthenticationStatus.unauthenticated) {
          if (isGoingTo == login || isGoingTo == signup) return null;

          return login;
        }

        if (authStatus == AuthenticationStatus.authenticated) {
          if (isGoingTo == login ||
              isGoingTo == signup ||
              isGoingTo == loading) {
            return home;
          }
        }

        return null;
      });
}
