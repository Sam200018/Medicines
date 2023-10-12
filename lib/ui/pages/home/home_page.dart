import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicines/ui/pages/home/at_home/at_home_page.dart';
import 'package:medicines/ui/pages/home/not_at_home/not_at_home_page.dart';
import 'home_bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is AtHome) {
          return const AtHomePage();
        }
        if (state is NotAtHome) {
          return const NotAtHomePage();
        }

        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
