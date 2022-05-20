import 'package:flutter/material.dart';
import 'package:flutter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_app/persentation/screens/second_screen.dart';
import 'package:flutter_app/persentation/screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'persentation/router/app_router.dart';
import 'persentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
