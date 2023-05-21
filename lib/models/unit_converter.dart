import 'dart:math';

import 'units/unit.dart';
import 'units/units.dart';
import 'dart:core';
import 'calc_utilites/precision_calculations.dart';

int _availablePrecisions = 12;
int _defaultPrecision = 6;

double? convertUnits(String fromUnitName, String toUnitName,
    double originalValue, int significantFigures) {
  double? convertedValue;

  if (fromUnitName == toUnitName) {
    return originalValue;
  }

  Unit? fromUnit = getUnitFromName(fromUnitName);
  Unit? toUnit = getUnitFromName(toUnitName);

  if (fromUnit == null || toUnit == null) {
    return null;
  }

  if (fromUnit.getUnitType() != toUnit.getUnitType()) {
    return null;
  }

  convertedValue = fromUnit.convertTo(toUnit, originalValue);

  if (convertedValue != null) {
    convertedValue = roundToNumDecimals(convertedValue, significantFigures);
  }

  return convertedValue;
}

List<Map<String, dynamic>> getPrecisionsInfoMap() {
  List<Map<String, dynamic>> precisionsInfo = [];

  int numberPrecisions = max(_defaultPrecision, _availablePrecisions);

  for (int i = 1; i <= numberPrecisions; i++) {
    precisionsInfo.add({'value': i, 'label': i});
  }
  return precisionsInfo;
}

int getDefaultPrecision() {
  return _defaultPrecision;
}
