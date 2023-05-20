import 'package:conversion_app/models/units/unit.dart';

import '../../calc_utilites/precision_calculations.dart';

class EnergyUnit extends Unit {
  static const String unitType = 'energy';

  EnergyUnit(
      {required super.name, required super.suffix, required super.toSIMult});

  @override
  double? convertTo(Unit toUnit, double originalValue) {
    double standardUnitValue = preciseMult(originalValue, toSIMult);
    double convertedValue = preciseDivision(standardUnitValue, toUnit.toSIMult);
    return convertedValue;
  }

  @override
  String getUnitType() {
    return unitType;
  }
}
