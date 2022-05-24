import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('I Success'),
                      duration: Duration(milliseconds: 300)),
                );
              } else if (state is DecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('D Success'),
                      duration: Duration(milliseconds: 300)),
                );
              }
            },
            builder: (context, state) {
              return Text('Counter Value: ${state.counterValue} ');
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                  },
                  child: const Text('increase')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                  },
                  child: const Text('decrease')),
            ],
          ),
        ],
      ),
    );
  }
}
