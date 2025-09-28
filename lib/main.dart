import 'package:app_condominio/login/login.dart';
import 'package:app_condominio/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Revisa si existe un token guardado en SharedPreferences
  Future<bool> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Administración Condominio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/login': (context) => const SignInPage1(),
        '/navbar': (context) => const NavegacionInferiorSimple(),
      },
      // Aquí decidimos qué pantalla mostrar
      home: FutureBuilder<bool>(
        future: _checkLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras carga SharedPreferences, muestra un loader
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            // Si hay token -> Ir directo al navbar
            return const NavegacionInferiorSimple();
          } else {
            // Si no hay token -> Ir al login
            return const SignInPage1();
          }
        },
      ),
    );
  }
}
