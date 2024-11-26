import 'package:shared_preferences/shared_preferences.dart';
import '../models/consumo.dart';
import 'dart:convert';

class EnergyConsumptionService {
  Future<void> saveConsumption(EnergyConsumption consumption) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> consumptionList = prefs.getStringList('consumptions') ?? [];
    
    consumptionList.add(json.encode({
      'date': consumption.date.toIso8601String(),
      'consumption': consumption.consumption,
      'cost': consumption.cost,
    }));

    await prefs.setStringList('consumptions', consumptionList);
  }

  Future<List<EnergyConsumption>> getConsumptions() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> consumptionList = prefs.getStringList('consumptions') ?? [];

    return consumptionList.map((item) {
      final map = json.decode(item);
      return EnergyConsumption(
        date: DateTime.parse(map['date']),
        consumption: map['consumption'],
        cost: map['cost'],
      );
    }).toList();
  }
}