import 'package:conversion_app/models/units/unit.dart';

class VolumeUnit extends Unit {
  static const String unitType = 'volume';

  VolumeUnit({required super.name, required super.suffix});

  @override
  double? convertTo(Unit toUnit, double originalValue) {
    double? cubicMeterValue;
    switch (name) {
      case 'Cubic meter':
        cubicMeterValue = originalValue;
        break;
      case 'Liter':
        cubicMeterValue = originalValue * 1e-3;
        break;
      case 'Cubic decimeter':
        cubicMeterValue = originalValue * 1e-3;
        break;
      case 'Cubic centimeter':
        cubicMeterValue = originalValue * 1e-6;
        break;
      case 'Cubic millimeter':
        cubicMeterValue = originalValue * 1e-9;
        break;
      case 'Cubic inch':
        cubicMeterValue = originalValue * 1.6387064E-5;
        break;
      case 'Pint - US':
        cubicMeterValue = originalValue * 0.0004731765;
        break;
      case 'Gallon - US':
        cubicMeterValue = originalValue * 0.0037854118;
        break;
      case 'Ounce - US':
        cubicMeterValue = originalValue * (1 / 33814.022701843);
        break;
    }

    double? convertedValue;
    if (cubicMeterValue != null) {
      switch (toUnit.name) {
        case 'Cubic meter':
          convertedValue = cubicMeterValue;
          break;
        case 'Liter':
          convertedValue = cubicMeterValue * 1e3;
          break;
        case 'Cubic decimeter':
          convertedValue = cubicMeterValue * 1e3;
          break;
        case 'Cubic centimeter':
          convertedValue = cubicMeterValue * 1e6;
          break;
        case 'Cubic millimeter':
          convertedValue = cubicMeterValue * 1e9;
          break;
        case 'Cubic inch':
          convertedValue = cubicMeterValue * (1 / 1.6387064E-5);
          break;
        case 'Pint - US':
          convertedValue = cubicMeterValue * (1 / 0.0004731765);
          break;
        case 'Gallon - US':
          convertedValue = cubicMeterValue * (1 / 0.0037854118);
          break;
        case 'Ounce - US':
          convertedValue = cubicMeterValue * 33814.022701843;
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
