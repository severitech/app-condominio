import 'package:app_condominio/navigation/nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Administración Condominio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavegacionInferiorSimple(),
    );
  }
}

