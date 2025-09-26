import 'package:flutter/material.dart';

class RecordatorioItem extends StatelessWidget {
  final String fecha;
  final String concepto;

  const RecordatorioItem({super.key, required this.fecha, required this.concepto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text("Recordatorio: $concepto"),
        subtitle: Text("Vence el: $fecha"),
        trailing: const Icon(Icons.notifications, color: Colors.orange),
      ),
    );
  }
}
