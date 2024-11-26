class Device {
  final String name;
  final double power;
  final double dailyUsageHours;

  Device({
    required this.name,
    required this.power,
    required this.dailyUsageHours,
  });

    double calculateMonthlyCost(double energyTariff) {
    return (power * dailyUsageHours * 30 * energyTariff) / 1000;
  }
}