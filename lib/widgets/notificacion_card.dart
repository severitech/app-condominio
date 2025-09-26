import 'package:flutter/material.dart';

class NotificacionCard extends StatelessWidget {
  final String mensaje;

  const NotificacionCard({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.red),
        title: Text("Alerta: $mensaje", style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
