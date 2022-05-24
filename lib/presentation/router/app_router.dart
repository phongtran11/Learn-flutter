import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/screens/counter_screen/counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String counter = 'counter';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
        return MaterialPageRoute(
          builder: (_) => const CounterScreen(
            title: 'Screen Home',
          ),
        );
      default:
        throw Exception();
    }
  }
}
