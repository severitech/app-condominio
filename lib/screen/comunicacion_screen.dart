import 'package:flutter/material.dart';
import '../widgets/aviso_card.dart';

class ComunicacionScreen extends StatelessWidget {
  const ComunicacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comunicados")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AvisoCard(titulo: "Mantenimiento de ascensor", descripcion: "Se realizará el día 30/09."),
          AvisoCard(titulo: "Reunión de vecinos", descripcion: "Convocatoria para el 05/10 a las 7 pm."),
        ],
      ),
    );
  }
}
