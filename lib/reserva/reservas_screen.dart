import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MisReservasScreen extends StatefulWidget {
  const MisReservasScreen({super.key});

  @override
  State<MisReservasScreen> createState() => _MisReservasScreenState();
}

class _MisReservasScreenState extends State<MisReservasScreen> {
  static const String reservasUrl =
      "http://192.168.1.7:8000/api/areas-comunes/reservas/";
  static const String espaciosUrl =
      "http://192.168.1.7:8000/api/areas-comunes/espacios-comunes/";

  late Future<List<dynamic>> _reservasFuture;
  bool _cargando = false;

  @override
  void initState() {
    super.initState();
    _reservasFuture = _getReservas();
  }

  Future<List<dynamic>> _getReservas() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    final response = await http.get(
      Uri.parse(reservasUrl),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as List)
          .where((r) => r['estado'] == 'solicitada')
          .toList();
    } else {
      throw Exception("Error al obtener reservas: ${response.body}");
    }
  }

  Future<List<dynamic>> _getEspacios() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    final response = await http.get(
      Uri.parse(espaciosUrl),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error al obtener espacios: ${response.body}");
    }
  }

  Future<void> _crearReserva(Map<String, dynamic> datos) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    setState(() => _cargando = true);

    final response = await http.post(
      Uri.parse(reservasUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(datos),
    );

    setState(() => _cargando = false);

    if (response.statusCode == 201) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Reserva solicitada")),
      );
      setState(() {
        _reservasFuture = _getReservas();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error: ${response.body}")),
      );
    }
  }

  Future<void> _eliminarReserva(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    final response = await http.delete(
      Uri.parse("$reservasUrl$id/"),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 204) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("🗑️ Reserva eliminada")),
      );
      setState(() {
        _reservasFuture = _getReservas();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error: ${response.body}")),
      );
    }
  }

  void _mostrarFormularioReserva(dynamic espacio) {
    final _eventoController = TextEditingController();
    final _observacionesController = TextEditingController();
    DateTime? fechaSeleccionada;
    TimeOfDay? horaInicio;
    TimeOfDay? horaFin;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return Dialog(
              insetPadding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Reservar ${espacio['nombre']}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        final fecha = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (fecha != null) {
                          setStateDialog(() => fechaSeleccionada = fecha);
                        }
                      },
                      child: Text(fechaSeleccionada == null
                          ? "Seleccionar fecha"
                          : "📅 ${fechaSeleccionada!.toLocal()}".split(" ")[0]),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final hora = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (hora != null) {
                                setStateDialog(() => horaInicio = hora);
                              }
                            },
                            child: Text(horaInicio == null
                                ? "Hora inicio"
                                : "Inicio: ${horaInicio!.format(context)}"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final hora = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (hora != null) {
                                setStateDialog(() => horaFin = hora);
                              }
                            },
                            child: Text(horaFin == null
                                ? "Hora fin"
                                : "Fin: ${horaFin!.format(context)}"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _eventoController,
                      decoration: const InputDecoration(
                        labelText: "Tipo de evento",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _observacionesController,
                      decoration: const InputDecoration(
                        labelText: "Observaciones",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (fechaSeleccionada == null ||
                            horaInicio == null ||
                            horaFin == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Seleccione fecha y horas")),
                          );
                          return;
                        }
                        final datos = {
                          "espacio_comun": espacio['id'],
                          "fecha_reserva": fechaSeleccionada!
                              .toIso8601String()
                              .split("T")[0],
                          "hora_inicio":
                              "${horaInicio!.hour.toString().padLeft(2, '0')}:${horaInicio!.minute.toString().padLeft(2, '0')}:00",
                          "hora_fin":
                              "${horaFin!.hour.toString().padLeft(2, '0')}:${horaFin!.minute.toString().padLeft(2, '0')}:00",
                          "tipo_evento": _eventoController.text,
                          "observaciones_cliente":
                              _observacionesController.text,
                          "monto_total": espacio['precio_evento_completo'],
                          "monto_deposito": espacio['monto_deposito'],
                        };
                        _crearReserva(datos);
                      },
                      child: _cargando
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Confirmar reserva"),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarEspaciosDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: FutureBuilder<List<dynamic>>(
            future: _getEspacios(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 150,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("No hay áreas disponibles."),
                );
              } else {
                final espacios = snapshot.data!;
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: espacios.length,
                    itemBuilder: (context, index) {
                      final e = espacios[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(e['nombre']),
                          subtitle: Text(
                              "Precio: ${e['precio_evento_completo']} Bs\nDepósito: ${e['monto_deposito']} Bs"),
                          trailing: ElevatedButton(
                            onPressed: () => _mostrarFormularioReserva(e),
                            child: const Text("Solicitar"),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Reservas"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Reservas solicitadas",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _reservasFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("No tienes reservas solicitadas.");
                  } else {
                    final reservas = snapshot.data!;
                    return ListView.builder(
                      itemCount: reservas.length,
                      itemBuilder: (context, index) {
                        final r = reservas[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: const Icon(Icons.event, color: Colors.blue),
                            title: Text(
                                "Espacio: ${r['espacio_comun_nombre'] ?? r['espacio_comun']}"),
                            subtitle: Text(
                              "Fecha: ${r['fecha_reserva']}\n"
                              "Hora: ${r['hora_inicio']} - ${r['hora_fin']}\n"
                              "Evento: ${r['tipo_evento']}\n"
                              "Observaciones: ${r['observaciones_cliente'] ?? ''}\n"
                              "Estado: ${r['estado']}",
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _eliminarReserva(r['id']),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _mostrarEspaciosDialog,
        label: const Text("Nueva Reserva"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
