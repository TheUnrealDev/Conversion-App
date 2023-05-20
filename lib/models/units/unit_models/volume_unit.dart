import '../../calc_utilites/precision_calculations.dart';
import '../unit.dart';

class VolumeUnit extends Unit {
  static const String unitType = 'volume';

  VolumeUnit(
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
