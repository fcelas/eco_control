import 'package:flutter/material.dart';

class Calculador extends StatefulWidget {
  @override
  _CalculadorState createState() => _CalculadorState();
}

class _CalculadorState extends State<Calculador> {
  final _nomeController = TextEditingController();
  final _potenciaController = TextEditingController();
  final _horasController = TextEditingController();
  final _tarifaController = TextEditingController();

  List<DispositivoEnergia> _dispositivos = [];

  void _calcularDispositivo() {
    final nome = _nomeController.text;
    final potencia = double.tryParse(_potenciaController.text) ?? 0;
    final horas = double.tryParse(_horasController.text) ?? 0;
    final tarifa = double.tryParse(_tarifaController.text) ?? 0;

    final consumoMensal = (potencia * horas * 30) / 1000;
    final custoMensal = consumoMensal * tarifa;

    setState(() {
      _dispositivos.add(DispositivoEnergia(
        nome: nome,
        potencia: potencia,
        horasUso: horas,
        consumoMensal: consumoMensal,
        custoMensal: custoMensal,
      ));
    });

    // Limpar campos
    _nomeController.clear();
    _potenciaController.clear();
    _horasController.clear();
    _tarifaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Dispositivo'),
            ),
            TextField(
              controller: _potenciaController,
              decoration: InputDecoration(labelText: 'Potência (watts)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _horasController,
              decoration: InputDecoration(labelText: 'Horas de Uso Diário'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tarifaController,
              decoration: InputDecoration(
                labelText: 'Tarifa de Energia (R\$/kWh)', 
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _calcularDispositivo,
              child: Text('Calcular'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _dispositivos.length,
                itemBuilder: (context, index) {
                  final dispositivo = _dispositivos[index];
                  return ListTile(
                    title: Text(dispositivo.nome),
                    subtitle: Text(
                      'Consumo Mensal: ${dispositivo.consumoMensal.toStringAsFixed(2)} kWh\n'
                      'Custo Mensal: R\$ ${dispositivo.custoMensal.toStringAsFixed(2)}'
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DispositivoEnergia {
  final String nome;
  final double potencia;
  final double horasUso;
  final double consumoMensal;
  final double custoMensal;

  DispositivoEnergia({
    required this.nome,
    required this.potencia,
    required this.horasUso,
    required this.consumoMensal,
    required this.custoMensal,
  });
}