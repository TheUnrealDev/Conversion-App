import 'package:conversion_app/models/units/unit.dart';

class DistanceUnit extends Unit {
  static const String unitType = 'distance';

  DistanceUnit({required super.name, required super.suffix});

  @override
  double? convertTo(Unit toUnit, double originalValue) {
    double? meterValue;
    switch (name) {
      case 'meter':
        meterValue = originalValue;
        break;
      case 'kilometer':
        meterValue = originalValue * 1000;
        break;
      case 'decimeter':
        meterValue = originalValue * 0.1;
        break;
      case 'centimeter':
        meterValue = originalValue * 0.01;
        break;
      case 'millimeter':
        meterValue = originalValue * 0.001;
        break;
      case 'micrometer':
        meterValue = originalValue * 1e-6;
        break;
      case 'nanometer':
        meterValue = originalValue * 1e-9;
        break;
      case 'picometer':
        meterValue = originalValue * 1e-12;
        break;
      case 'mile':
        meterValue = originalValue * 1609.344;
        break;
      case 'yard':
        meterValue = originalValue * 0.9144;
        break;
      case 'foot':
        meterValue = originalValue * 0.3048;
        break;
      case 'inch':
        meterValue = originalValue * 0.0254;
        break;
    }

    double? convertedValue;
    if (meterValue != null) {
      switch (toUnit.name) {
        case 'meter':
          convertedValue = meterValue;
          break;
        case 'kilometer':
          convertedValue = meterValue * 0.001;
          break;
        case 'decimeter':
          convertedValue = meterValue * 10;
          break;
        case 'centimeter':
          convertedValue = meterValue * 100;
          break;
        case 'millimeter':
          convertedValue = meterValue * 1000;
          break;
        case 'micrometer':
          convertedValue = meterValue * 1e6;
          break;
        case 'nanometer':
          convertedValue = meterValue * 1e9;
          break;
        case 'picometer':
          convertedValue = meterValue * 1e12;
          break;
        case 'mile':
          convertedValue = meterValue * (1 / 1609.344);
          break;
        case 'yard':
          convertedValue = meterValue * (1 / 0.9144);
          break;
        case 'foot':
          convertedValue = meterValue * (1 / 0.3048);
          break;
        case 'inch':
          convertedValue = meterValue * (1 / 0.0254);
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
