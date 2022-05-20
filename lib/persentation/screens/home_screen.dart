import 'package:flutter/material.dart';
import 'package:flutter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_app/persentation/screens/second_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, this.color})
      : super(key: key);
  final String title;
  final Color? color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showBottomSheet(
                    (BuildContext context) {
                      return Container(
                        child: const Text('Increase'),
                        height: 20,
                        width: double.maxFinite,
                      );
                    },
                  );
                } else {
                  Scaffold.of(context).showBottomSheet(
                    (BuildContext context) {
                      return Container(
                        child: const Text('Decrese'),
                        height: 20,
                        width: double.maxFinite,
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: 'a',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'b',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: widget.color,
              child: const Text('Go to 2'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
            ),
            MaterialButton(
              color: Colors.green,
              child: const Text('Go to 3'),
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}
