import 'package:flutter/material.dart';
import 'telas/home.dart';
import 'telas/calculador.dart';

void main() {
  runApp(EcoControlApp());
}

class EcoControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoControl',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.energy_savings_leaf), text: 'Consumo'),
                Tab(icon: Icon(Icons.calculate), text: 'Calculadora'),
              ],
            ),
            title: Text('EcoControl'),
          ),
          body: TabBarView(
            children: [
              Home(),
              Calculador(),
            ],
          ),
        ),
      ),
    );
  }
}