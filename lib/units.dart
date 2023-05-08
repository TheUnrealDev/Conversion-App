import 'unit.dart';

final List<Unit> _unitList = [
  Unit(unitType: 'temperature', name: 'Celsius', suffix: 'C°'),
  Unit(unitType: 'temperature', name: 'Kelvin', suffix: 'K°'),
  Unit(unitType: 'temperature', name: 'Fahrenheit', suffix: 'F°'),
  Unit(unitType: 'distance', name: 'Meter', suffix: 'm'),
  Unit(unitType: 'distance', name: 'Decimeter', suffix: 'dm'),
  Unit(unitType: 'mass', name: 'Kilogram', suffix: 'kg'),
];

List<Unit> _getUnitsOfType(String unitType) {
  List<Unit> unitsOfType = [];
  for (Unit unit in _unitList) {
    if (unit.unitType == unitType) {
      unitsOfType.add(unit);
    }
  }
  return unitsOfType;
}

List<Map<String, dynamic>> getUnitInfoMapOfType(String unitType) {
  List<Map<String, dynamic>> unitsInfo = [];

  List<Unit> unitsOfType = _getUnitsOfType(unitType);
  for (Unit unit in unitsOfType) {
    String unitName = unit.name;
    String unitSuffix = unit.suffix;
    unitsInfo.add(
      {'value': unitName, 'label': '$unitName ($unitSuffix)'},
    );
  }
  return unitsInfo;
}

String getUnitTypeFromName(String unitName) {
  String unitType = '';
  for (Unit unit in _unitList) {
    if (unit.name == unitName) {
      unitType = unit.unitType;
    }
  }
  return unitType;
}

String getUnitSuffixFromName(String unitName) {
  String unitSuffix = '';
  for (Unit unit in _unitList) {
    if (unit.name == unitName) {
      unitSuffix = unit.suffix;
    }
  }
  return unitSuffix;
}
