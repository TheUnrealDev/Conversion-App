import 'temperature_unit.dart';

import 'unit.dart';

final List<Unit> _unitList = [
  TemperatureUnit(name: 'Celsius', suffix: 'C°'),
  TemperatureUnit(name: 'Kelvin', suffix: 'K°'),
  TemperatureUnit(name: 'Fahrenheit', suffix: 'F°'),
  //Unit(unitType: 'distance', name: 'Meter', suffix: 'm'),
  // Unit(unitType: 'distance', name: 'Decimeter', suffix: 'dm'),
  // Unit(unitType: 'mass', name: 'Kilogram', suffix: 'kg'),
];

List<Unit> _getUnitsOfType(String unitType) {
  List<Unit> unitsOfType = [];
  for (Unit unit in _unitList) {
    if (unit.getUnitType() == unitType) {
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

String getUnitSuffixFromName(String unitName) {
  String unitSuffix = '';
  for (Unit unit in _unitList) {
    if (unit.name == unitName) {
      unitSuffix = unit.suffix;
      break;
    }
  }
  return unitSuffix;
}

Unit? getUnitFromName(String unitName) {
  Unit? foundUnit;
  for (Unit unit in _unitList) {
    if (unit.name == unitName) {
      foundUnit = unit;
      break;
    }
  }
  return foundUnit;
}
