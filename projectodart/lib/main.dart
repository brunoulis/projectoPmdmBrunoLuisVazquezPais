import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infotrebajos',
      debugShowCheckedModeBanner: false,
      // Fem ús de rutes, en lloc del home)
      initialRoute: '/',
      routes: {
        '/': (context) => const SelectorCiudad(),
      },
    ); 
  }
}