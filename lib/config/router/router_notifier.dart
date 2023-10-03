import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:medicines/ui/pages/home/auth/auth_bloc.dart';


class AuthStateNotifier extends ChangeNotifier {
  late final StreamSubscription<AuthState> _blocStream;

  authStateProvider(AuthBloc bloc) {
    _blocStream = bloc.stream.listen((event) {
      print(event);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _blocStream.cancel();
    super.dispose();
  }
}