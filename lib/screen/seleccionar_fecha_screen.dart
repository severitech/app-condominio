import 'package:flutter/material.dart';

class SeleccionarFechaScreen extends StatelessWidget {
  final String area;

  const SeleccionarFechaScreen({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    // Lista de fechas disponibles simulada
    List<String> fechasDisponibles = ["10/10/2025", "12/10/2025", "15/10/2025"];

    return Scaffold(
      appBar: AppBar(title: Text("Seleccionar Fecha para $area")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: fechasDisponibles.map((fecha) {
          return _FechaCard(fecha: fecha, onTap: () {
            // Navegar a la pantalla de confirmación con la fecha seleccionada
            Navigator.pushNamed(
              context,
              '/confirmar-reserva',
              arguments: {'area': area, 'fecha': fecha},
            );
          });
        }).toList(),
      ),
    );
  }
}

class _FechaCard extends StatelessWidget {
  final String fecha;
  final VoidCallback onTap;

  const _FechaCard({super.key, required this.fecha, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(fecha),
        trailing: const Icon(Icons.check_circle_outline),
        onTap: onTap,
      ),
    );
  }
}
