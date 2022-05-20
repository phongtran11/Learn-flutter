import 'package:flutter/material.dart';
import 'package:flutter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_app/persentation/screens/second_screen.dart';
import 'package:flutter_app/persentation/screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'persentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(
                  title: 'HomeScreen', color: Colors.redAccent),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(title: 'second', color: Colors.blue),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(title: 'third', color: Colors.orange),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
