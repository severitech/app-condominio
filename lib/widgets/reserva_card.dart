import 'package:app_condominio/screen/confirmar_reserva_screen.dart';
import 'package:app_condominio/screen/notificacion_push_screen.dart';
import 'package:app_condominio/screen/seleccionar_area_screen.dart';
import 'package:app_condominio/screen/seleccionar_fecha_screen.dart';
import 'package:flutter/material.dart';

class ReservaCard extends StatelessWidget {
  final String area;
  final String fecha;
  final String estado;

  const ReservaCard({
    super.key,
    required this.area,
    required this.fecha,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva de Áreas Comunes',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const SeleccionarAreaScreen(),
        '/seleccionar-fecha': (context) => SeleccionarFechaScreen(
          area: ModalRoute.of(context)!.settings.arguments as String,
        ),
        '/confirmar-reserva': (context) => ConfirmarReservaScreen(
          area: (ModalRoute.of(context)!.settings.arguments as Map)['area'],
          fecha: (ModalRoute.of(context)!.settings.arguments as Map)['fecha'],
        ),
        '/notificacion-push': (context) => const NotificacionPushScreen(),
      },
    );
  }
}
