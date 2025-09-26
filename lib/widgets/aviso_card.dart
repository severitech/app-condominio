import 'package:flutter/material.dart';

class AvisoCard extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const AvisoCard({super.key, required this.titulo, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(descripcion),
      ),
    );
  }
}
