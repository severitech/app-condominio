import 'package:flutter/material.dart';
import '../widgets/reserva_card.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reservas")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ReservaCard(area: "Piscina", fecha: "10/10/2025", estado: "Confirmada"),
          ReservaCard(area: "Parrilla", fecha: "12/10/2025", estado: "Pendiente de Pago"),
        ],
      ),
    );
  }
}
