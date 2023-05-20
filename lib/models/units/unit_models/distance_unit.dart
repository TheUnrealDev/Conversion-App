
import 'package:conversion_app/models/calc_utilites/precision_calculations.dart';
import 'package:conversion_app/models/units/unit.dart';

class DistanceUnit extends Unit {
  static const String unitType = 'distance';

  DistanceUnit(
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
