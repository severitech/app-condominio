import 'package:flutter/material.dart';

class PaginaCarrito extends StatefulWidget {
  const PaginaCarrito({super.key});

  @override
  State<PaginaCarrito> createState() => _PaginaCarritoState();
}

class _PaginaCarritoState extends State<PaginaCarrito> {
  TextEditingController _montoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_bag, size: 50, color: Colors.blue),
          const SizedBox(height: 20),
          const Text('Servicios y Cargos', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          const Text('• Mantenimiento mensual: 50 USD', style: TextStyle(fontSize: 16)),
          const Text('• Compra de productos del condominio: 30 USD', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          const Text('Agregar un nuevo pago:', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          TextField(
            controller: _montoController,
            decoration: const InputDecoration(
              labelText: 'Monto a pagar',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Acción para realizar el pago
              if (_montoController.text.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmar Pago'),
                    content: Text('¿Confirmas el pago de ${_montoController.text} USD?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Acción para procesar el pago
                          Navigator.pop(context);
                        },
                        child: const Text('Confirmar'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text('Pagar'),
          ),
        ],
      ),
    );
  }
}
