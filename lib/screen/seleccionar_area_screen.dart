import 'package:flutter/material.dart';

class SeleccionarAreaScreen extends StatelessWidget {
  const SeleccionarAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seleccionar Área")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _AreaCard(area: "Piscina", onTap: () {
            // Navegar a la pantalla de selección de fechas
            Navigator.pushNamed(context, '/seleccionar-fecha', arguments: "Piscina");
          }),
          _AreaCard(area: "Parrilla", onTap: () {
            Navigator.pushNamed(context, '/seleccionar-fecha', arguments: "Parrilla");
          }),
          _AreaCard(area: "Gimnasio", onTap: () {
            Navigator.pushNamed(context, '/seleccionar-fecha', arguments: "Gimnasio");
          }),
        ],
      ),
    );
  }
}

class _AreaCard extends StatelessWidget {
  final String area;
  final VoidCallback onTap;

  const _AreaCard({super.key, required this.area, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(area),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
