import 'package:app_condominio/1inicio/inicio.dart';
import 'package:app_condominio/2marcadores/marcadores.dart';
import 'package:app_condominio/3deudas/deudas.dart';
import 'package:app_condominio/4perfil/perfil.dart';
import 'package:flutter/material.dart';

class _NavegacionInferiorSimpleState extends State<NavegacionInferiorSimple> {
  int _indiceSeleccionado = 0;
  
  // Lista de las vistas que vamos a mostrar según la opción seleccionada
  final List<Widget> _paginas = [
    const PaginaInicio(),      // Vista de "Inicio"
    const PaginaMarcadores(),  // Vista de "Marcadores"
    const PaginaCarrito(),     // Vista de "Carrito"
    const PaginaPerfil(),      // Vista de "Perfil"
  ];

  BottomNavigationBarType _tipoNavInferior = BottomNavigationBarType.fixed;

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
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            activeIcon: Icon(Icons.bookmark_rounded),
            label: 'Marcadores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Carrito',
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

class   NavegacionInferiorSimple extends StatefulWidget {
  const NavegacionInferiorSimple({super.key});

  @override
  State<NavegacionInferiorSimple> createState() => _NavegacionInferiorSimpleState();
}