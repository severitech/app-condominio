import 'package:flutter/material.dart';

class ConfirmarReservaScreen extends StatelessWidget {
  final String area;
  final String fecha;

  const ConfirmarReservaScreen({super.key, required this.area, required this.fecha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmar Reserva")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Área seleccionada: $area", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Text("Fecha de reserva: $fecha", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Realizar pago (simulación)
                _realizarReserva(context);
              },
              child: const Text("Confirmar y Pagar"),
            ),
          ],
        ),
      ),
    );
  }

  void _realizarReserva(BuildContext context) {
    // Aquí se simula la reserva y el pago
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reserva confirmada. ¡Disfruta tu espacio!')),
    );

    // Navegar a la pantalla de notificación
    Navigator.pushNamed(context, '/notificacion-push');
  }
}
