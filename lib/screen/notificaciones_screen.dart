import 'package:flutter/material.dart';
import '../widgets/notificacion_card.dart';

class NotificacionesScreen extends StatelessWidget {
  const NotificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notificaciones")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificacionCard(mensaje: "Acceso no autorizado detectado en el lobby."),
          NotificacionCard(mensaje: "Persona desconocida en la azotea."),
        ],
      ),
    );
  }
}
