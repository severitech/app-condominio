import 'package:flutter/material.dart';

class HistorialPagoItem extends StatelessWidget {
  final String fecha;
  final String monto;
  final String comprobante;

  const HistorialPagoItem({
    super.key,
    required this.fecha,
    required this.monto,
    required this.comprobante,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text("Pago realizado el: $fecha"),
        subtitle: Text("Monto: $monto"),
        trailing: ElevatedButton(
          onPressed: () {
            // Acción para ver el comprobante (puede abrir un PDF, por ejemplo)
          },
          child: Text(comprobante),
        ),
      ),
    );
  }
}
