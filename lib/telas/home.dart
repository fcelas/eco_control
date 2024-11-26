import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> _consumptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildConsumptionChart(),
          ElevatedButton(
            onPressed: () {
            },
            child: Text('Adicionar Consumo'),
          ),
        ],
      ),
    );
  }

  Widget _buildConsumptionChart() {
    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: _consumptions.isEmpty
                ? [FlSpot(0, 0)]
                : _consumptions.map((c) => FlSpot(0, 0)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}