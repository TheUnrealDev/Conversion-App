import '../unit.dart';

import '../../calc_utilites/precision_calculations.dart';

class VelocityUnit extends Unit {
  static const String unitType = 'velocity';

  VelocityUnit(
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
