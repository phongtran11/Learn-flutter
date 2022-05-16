import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Cat {
  final String name;
  Cat(this.name);

  // factory Cat.fluffBal() {
  //   return Cat('Fluff Ball');
  // }  create factory default Cat;

  @override
  bool operator ==(covariant Cat other) => other.name == name;

  @override
  int get hashCode => name.hashCode;
}

// void test() {
//   final fluffBall = Cat.fluffBal();
//   print(fluffBall.name);
// }

void test1() {
  final cat1 = Cat('Foo');
  final cat2 = Cat('Foo');

  if (cat1 == cat2) {
    print('They are equal');
  } else {
    print('they are not equal');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    test1();
    // TODO: implement build
    throw UnimplementedError();
  }
}
