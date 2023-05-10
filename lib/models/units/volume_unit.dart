import 'package:conversion_app/models/units/unit.dart';

class VolumeUnit extends Unit {
  static const String unitType = 'volume';

  VolumeUnit({required super.name, required super.suffix});

  @override
  double? convertTo(String toUnit, double originalValue) {
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
      case 'Pint':
        cubicMeterValue = originalValue * 0.0004731765;
        break;
      case 'Gallon':
        cubicMeterValue = originalValue * 0.0037854118;
        break;
      case 'Ounce - US':
        cubicMeterValue = originalValue * 2.95735295641118e-5;
        break;
    }

    double? convertedValue;
    if (cubicMeterValue != null) {
      switch (toUnit) {
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
          convertedValue = cubicMeterValue * 61023.744094732;
          break;
        case 'Pint - US':
          convertedValue = cubicMeterValue * 2113.3764188652;
          break;
        case 'Gallon - US':
          convertedValue = cubicMeterValue * 264.1720523581;
          break;
        case 'Ounce - US':
          convertedValue = cubicMeterValue * 33814.0227;
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
