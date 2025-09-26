import 'package:flutter/material.dart';

class NotificacionPushScreen extends StatelessWidget {
  const NotificacionPushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notificación Push")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Icon(Icons.notifications_active, size: 100, color: Colors.green),
            SizedBox(height: 16),
            Text("¡Tu reserva ha sido confirmada!", style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text("Recibirás un recordatorio antes de tu reserva.", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
