import 'package:app_condominio/widgets/reserva.dart';
import 'package:flutter/material.dart';
import 'package:app_condominio/screen/comunicacion_screen.dart';
import 'package:app_condominio/screen/finanzas_screen.dart';
import 'package:app_condominio/screen/notificaciones_screen.dart';

class _NavegacionInferiorSimpleState extends State<NavegacionInferiorSimple> {
  int _indiceSeleccionado = 0;

  // Lista de vistas que vamos a mostrar según la opción seleccionada
  final List<Widget> _paginas = [
    FinanzasScreen(),
    ComunicacionScreen(),
    ReservaScreen(),  // Aquí se agrega la pantalla de Reserva
    NotificacionesScreen(),
  ];

  final BottomNavigationBarType _tipoNavInferior = BottomNavigationBarType.fixed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administración Condominio'),
      ),
      // Aquí se cambia la vista según el índice seleccionado
      body: _paginas[_indiceSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSeleccionado,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        type: _tipoNavInferior,
        onTap: (index) {
          setState(() {
            _indiceSeleccionado = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            activeIcon: Icon(Icons.payment),
            label: 'Finanzas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            activeIcon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Reserva',  // Este podría ser tu componente de reservas
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class NavegacionInferiorSimple extends StatefulWidget {
  const NavegacionInferiorSimple({super.key});

  @override
  State<NavegacionInferiorSimple> createState() => _NavegacionInferiorSimpleState();
}
