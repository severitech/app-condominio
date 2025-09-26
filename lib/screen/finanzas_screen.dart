import 'package:flutter/material.dart';
import '../widgets/pago_card.dart';
import '../widgets/recordatorio_item.dart';
import '../widgets/historial_pago_item.dart';

class FinanzasScreen extends StatelessWidget {
  const FinanzasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Finanzas")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PagoCard(),
          SizedBox(height: 16),
          RecordatorioItem(fecha: "15/10/2025", concepto: "Cuota mantenimiento"),
          SizedBox(height: 16),
          HistorialPagoItem(fecha: "01/09/2025", monto: "S/250", comprobante: "PDF"),
        ],
      ),
    );
  }
}
