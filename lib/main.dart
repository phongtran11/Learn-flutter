import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int multipliedByTwo(int a) => a * 2;

Future<int> asynchronousFunction(int a) {
  return Future.delayed(const Duration(seconds: 1), () => multipliedByTwo(a));
}

void test() async {
  final result = await asynchronousFunction(2);
  print(result);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    test();
    throw UnimplementedError();
  }
}
