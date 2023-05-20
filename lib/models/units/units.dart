import 'unit.dart';
import 'volume_unit.dart';
import 'distance_unit.dart';
import 'temperature_unit.dart';
import 'energy_unit.dart';

final List<Unit> _unitList = [
  TemperatureUnit(name: 'Celsius', suffix: 'C°'),
  TemperatureUnit(name: 'Kelvin', suffix: 'K°'),
  TemperatureUnit(name: 'Fahrenheit', suffix: 'F°'),
  VolumeUnit(name: 'Liter', suffix: 'l'),
  VolumeUnit(name: 'Cubic meter', suffix: 'm³'),
  VolumeUnit(name: 'Cubic decimeter', suffix: 'dm³'),
  VolumeUnit(name: 'Cubic centimeter', suffix: 'cm³'),
  VolumeUnit(name: 'Cubic millimeter', suffix: 'mm³'),
  VolumeUnit(name: 'Cubic inch', suffix: 'cubic inches'),
  VolumeUnit(name: 'Pint - US', suffix: 'pints'),
  VolumeUnit(name: 'Gallon - US', suffix: 'gallons'),
  VolumeUnit(name: 'Ounce - US', suffix: 'fl. oz.'),
  DistanceUnit(name: 'meter', suffix: 'm'),
  DistanceUnit(name: 'decimeter', suffix: 'dm'),
  DistanceUnit(name: 'centimeter', suffix: 'cm'),
  DistanceUnit(name: 'millimeter', suffix: 'mm'),
  DistanceUnit(name: 'micrometer', suffix: 'μm'),
  DistanceUnit(name: 'nanometer', suffix: 'nm'),
  DistanceUnit(name: 'picometer', suffix: 'pm'),
  DistanceUnit(name: 'kilometer', suffix: 'km'),
  DistanceUnit(name: 'mile', suffix: 'miles'),
  DistanceUnit(name: 'yard', suffix: 'yards'),
  DistanceUnit(name: 'foot', suffix: 'feet'),
  DistanceUnit(name: 'inch', suffix: 'inches'),
  EnergyUnit(name: 'Joule', suffix: 'J'),
  EnergyUnit(name: 'Newton-meter', suffix: 'Nm'),
  EnergyUnit(name: 'Kilojoule', suffix: 'kJ'),
  EnergyUnit(name: 'Millijoule', suffix: 'mJ'),
  EnergyUnit(name: 'Microjoule', suffix: 'μJ'),
  EnergyUnit(name: 'Nanojoule', suffix: 'nJ'),
  EnergyUnit(name: 'Attojoule', suffix: 'aJ'),
  EnergyUnit(name: 'Kilocalorie', suffix: 'kcal'),
  EnergyUnit(name: 'Calorie', suffix: 'cal'),
  EnergyUnit(name: 'Kilowatt-hour', suffix: 'kWh'),
  EnergyUnit(name: 'Watt-hour', suffix: 'Wh'),
  EnergyUnit(name: 'Foot-pound', suffix: 'ft lb'),
  EnergyUnit(name: 'Ton - Explosives', suffix: 'ton'),
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
