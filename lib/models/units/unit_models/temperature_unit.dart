import '../unit.dart';

class TemperatureUnit extends Unit {
  static const String unitType = 'temperature';

  TemperatureUnit({required super.name, required super.suffix});

  @override
  double? convertTo(Unit toUnit, double originalValue) {
    double? celsiusValue;
    switch (name) {
      case 'Celsius':
        celsiusValue = originalValue;
        break;
      case 'Kelvin':
        celsiusValue = originalValue - 273.15;
        break;
      case 'Fahrenheit':
        celsiusValue = (originalValue - 32) / 1.8;
        break;
    }

    double? convertedValue;
    if (celsiusValue != null) {
      switch (toUnit.name) {
        case 'Celsius':
          convertedValue = celsiusValue;
          break;
        case 'Fahrenheit':
          convertedValue = (celsiusValue * 1.8) + 32;
          break;
        case 'Kelvin':
          convertedValue = celsiusValue + 273.15;
          break;
      }
    }
    return convertedValue;
  }

  @override
  String getUnitType() {
    return unitType;
  }
}
