import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva de Áreas Comunes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReservaScreen(), // Aquí se llama al flujo de reserva
    );
  }
}

class ReservaScreen extends StatefulWidget {
  const ReservaScreen({super.key});

  @override
  _ReservaScreenState createState() => _ReservaScreenState();
}

class _ReservaScreenState extends State<ReservaScreen> {
  String? selectedArea;
  String? selectedDate;
  bool reservationConfirmed = false;

  // Lista de áreas disponibles
  final List<String> areas = ['Piscina', 'Parrilla', 'Gimnasio'];

  // Fechas disponibles para cada área
  final Map<String, List<String>> availableDates = {
    'Piscina': ['10/10/2025', '12/10/2025', '15/10/2025'],
    'Parrilla': ['11/10/2025', '13/10/2025'],
    'Gimnasio': ['10/10/2025', '14/10/2025'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reserva de Áreas Comunes")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!reservationConfirmed) ...[
              // Selección de Área
              if (selectedArea == null) ...[
                const Text("Seleccione un área", style: TextStyle(fontSize: 18)),
                ...areas.map((area) => Card(
                  child: ListTile(
                    title: Text(area),
                    onTap: () {
                      setState(() {
                        selectedArea = area;
                      });
                    },
                  ),
                )),
              ],

              // Selección de Fecha
              if (selectedArea != null && selectedDate == null) ...[
                const SizedBox(height: 20),
                Text("Seleccione una fecha para $selectedArea", style: const TextStyle(fontSize: 18)),
                ...availableDates[selectedArea]!.map((date) => Card(
                  child: ListTile(
                    title: Text(date),
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                )),
              ],

              // Confirmación de Reserva
              if (selectedDate != null) ...[
                const SizedBox(height: 20),
                Text("Confirma tu reserva para $selectedArea el $selectedDate", style: const TextStyle(fontSize: 18)),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      reservationConfirmed = true;
                    });
                  },
                  child: const Text("Confirmar Reserva y Pagar"),
                ),
              ],
            ],

            // Notificación Push después de confirmación
            if (reservationConfirmed) ...[
              const SizedBox(height: 20),
              const Icon(Icons.notifications_active, size: 50, color: Colors.green),
              const SizedBox(height: 20),
              const Text("¡Tu reserva ha sido confirmada!", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              const Text("Recibirás un recordatorio antes de tu reserva.", style: TextStyle(fontSize: 16)),
            ],
          ],
        ),
      ),
    );
  }
}
