import 'package:flutter/material.dart';

class PagoCard extends StatelessWidget {
  const PagoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: const Text("Pagar cuota de mantenimiento"),
        subtitle: const Text("Monto pendiente: S/250"),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text("Pagar"),
        ),
      ),
    );
  }
}
