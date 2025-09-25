import 'package:flutter/material.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home, size: 50, color: Colors.blue),
          const SizedBox(height: 20),
          const Text('Bienvenido al Condominio', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          const Text('Últimos anuncios:', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          const Text('• Mantenimiento el próximo fin de semana', style: TextStyle(fontSize: 16)),
          const Text('• Recuerde pagar la renta antes del 5 de cada mes', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
