import 'units.dart';
import 'dart:core';
import 'dart:math';

double roundToNumDecimals(double number, int numDigits) {
  num roundMult = pow(10, numDigits);
  double roundedNum = (number * roundMult).roundToDouble() / roundMult;
  return roundedNum;
}

double? _temperatureConversion(
    String fromUnit, String toUnit, double originalValue) {
  double? celsiusValue;
  switch (fromUnit) {
    case 'Celsius':
      celsiusValue = originalValue;
      break;
    case 'Kelvin':
      celsiusValue = originalValue - 273.15;
      break;
    case 'Fahrenheit':
      celsiusValue = (originalValue - 32) / 1.8;
      break;
  }

  double? convertedValue;
  if (celsiusValue != null) {
    switch (toUnit) {
      case 'Celsius':
        convertedValue = celsiusValue;
        break;
      case 'Fahrenheit':
        convertedValue = (celsiusValue * 1.8) + 32;
        break;
      case 'Kelvin':
        convertedValue = celsiusValue + 273.15;
        break;
    }
  }

  return convertedValue;
}

double? convertUnits(
    String fromUnitName, String toUnitName, double originalValue) {
  double? convertedValue;

  String unitType = getUnitTypeFromName(fromUnitName);
  switch (unitType) {
    case 'temperature':
      convertedValue =
          _temperatureConversion(fromUnitName, toUnitName, originalValue);
      break;
  }
  if (convertedValue != null) {
    convertedValue = roundToNumDecimals(convertedValue, 8);
  }
  return convertedValue;
}
