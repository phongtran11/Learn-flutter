import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/contants/themes/app_theme.dart';
import 'package:flutter_app/logic/cubit/cubit/theme_cubit.dart';
import 'package:flutter_app/presentation/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      // Bloc.observer = AppBlocObserver();
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: Builder(builder: (appContext) {
        return MaterialApp(
          title: 'App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appContext
              .select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
          initialRoute: AppRouter.counter,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      }),
    );
  }
}
