import 'package:flutter/material.dart';
import 'package:projectodart/pantallas/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Material App',
      home: MyHomePage('Proyecto Dart'),
    ); 
  }
}