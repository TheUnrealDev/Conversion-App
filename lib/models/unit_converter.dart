import 'units/unit.dart';
import 'units/units.dart';
import 'dart:core';
import 'calc_utilites/precision_calculations.dart';

double? convertUnits(
    String fromUnitName, String toUnitName, double originalValue) {
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
    convertedValue = roundToNumDecimals(convertedValue, 12);
  }

  return convertedValue;
}
