import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';

class BluetoothService {
  BluetoothDevice? _connectedDevice;
  StreamController<double> _consumptionController = StreamController<double>();

  Future<bool> isAvailable() async {
    return await FlutterBluePlus.isAvailable;
  }

  Future<void> requestPermissions() async {
    await FlutterBluePlus.turnOn();
  }

  Stream<List<ScanResult>> scanDevices() {
    FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
    return FlutterBluePlus.scanResults;
  }

  Future<void> connectToDevice(ScanResult device) async {
    await device.device.connect();
    _connectedDevice = device.device;
  }

  Future<double> readEnergyConsumption() async {
    if (_connectedDevice == null) {
      throw Exception('Nenhum dispositivo conectado');
    }

    return 10.5; // consumo em kWh
  }

  Stream<double> get consumptionStream => _consumptionController.stream;

  void simulateConsumptionUpdates() {
    Timer.periodic(Duration(seconds: 5), (_) {
      final consumption = 10.0 + (DateTime.now().millisecond / 100);
      _consumptionController.add(consumption);
    });
  }

  void dispose() {
    _consumptionController.close();
  }
}