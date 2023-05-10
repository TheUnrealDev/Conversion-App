import 'units/unit.dart';
import 'units/units.dart';
import 'dart:core';
import 'dart:math';

double roundToNumDecimals(double number, int numDigits) {
  num roundMult = pow(10, numDigits);
  double roundedNum = (number * roundMult).roundToDouble() / roundMult;
  return roundedNum;
}

double? convertUnits(
    String fromUnitName, String toUnitName, double originalValue) {
  double? convertedValue;
  Unit? fromUnit = getUnitFromName(fromUnitName);
  if (fromUnit != null) {
    convertedValue = fromUnit.convertTo(toUnitName, originalValue);
    //Fix rounding of numbers to ignore leading zeros after decimal sign. Ex. 0.00000315

    if (convertedValue != null) {
      convertedValue = roundToNumDecimals(convertedValue, 12);
    }
  }

  return convertedValue;
}
