import 'package:flutter/material.dart';

class PaginaMarcadores extends StatelessWidget {
  const PaginaMarcadores({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bookmark, size: 50, color: Colors.blue),
          const SizedBox(height: 20),
          const Text('Avisos y Recordatorios', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          const Text('• Pago de renta el 5 de cada mes', style: TextStyle(fontSize: 16)),
          const Text('• Mantenimiento programado para el 15 de este mes', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Acción para mostrar más detalles o realizar una acción
            },
            child: const Text('Ver más avisos'),
          ),
        ],
      ),
    );
  }
}
