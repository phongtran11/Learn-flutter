import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Cat {
  final String name;
  Cat(this.name);
}

class Person {
  final String firstName;
  final String lastName;

  Person(this.firstName, this.lastName);
}

extension Run on Cat {
  void run() {
    print('Cat $name is running');
  }
}

extension FullName on Person {
  String get fullName => '$firstName $lastName';
}

void testPersion() {
  final foo = Person('Foo', 'Bar');
  print(foo.fullName);
}

void testCat() {
  final cat = Cat('black');
  cat.run();
  print(cat.name);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testCat();
    testPersion();
    // TODO: implement build
    throw UnimplementedError();
  }
}
