import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Stream<String> getName() {
  // return Stream.value('Foo');

  return Stream.periodic(
      const Duration(seconds: 1), (value) => 'foo'); // same like setTimeOut
}

void test() async {
  print('start');
  await for (final value in getName()) {
    print(value);
  }
  print('end');
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
