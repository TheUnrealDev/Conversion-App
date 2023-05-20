import 'unit_list/distance_list.dart';
import 'unit_list/energy_list.dart';
import 'unit_list/velocity_list.dart';
import 'unit_list/volume_list.dart';
import 'unit_list/temperature_list.dart';

import 'unit.dart';

final List<Unit> _unitList = [];

void initializeUnits() {
  _unitList.addAll(distanceUnits);
  _unitList.addAll(temperatureUnits);
  _unitList.addAll(volumeUnits);
  _unitList.addAll(energyUnits);
  _unitList.addAll(velocityUnits);
}

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
