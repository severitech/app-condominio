import 'package:flutter/material.dart';

class PaginaPerfil extends StatefulWidget {
  const PaginaPerfil({super.key});

  @override
  State<PaginaPerfil> createState() => _PaginaPerfilState();
}

class _PaginaPerfilState extends State<PaginaPerfil> {
  TextEditingController _nombreController = TextEditingController(text: 'Juan Pérez');
  TextEditingController _direccionController = TextEditingController(text: 'Apartamento 305, Edificio A');
  TextEditingController _telefonoController = TextEditingController(text: '123-456-789');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 50, color: Colors.blue),
          const SizedBox(height: 20),
          const Text('Perfil del Inquilino', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          TextField(
            controller: _nombreController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _direccionController,
            decoration: const InputDecoration(
              labelText: 'Dirección',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _telefonoController,
            decoration: const InputDecoration(
              labelText: 'Teléfono',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Acción para guardar los cambios
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmar cambios'),
                  content: const Text('¿Deseas guardar los cambios en tu perfil?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Acción para guardar cambios
                        Navigator.pop(context);
                      },
                      child: const Text('Guardar'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Guardar cambios'),
          ),
        ],
      ),
    );
  }
}
