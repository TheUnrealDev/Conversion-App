import 'package:conversion_app/models/units/unit.dart';
import 'package:flutter/material.dart';

import '../calc_utilites/precision_calculations.dart';

class EnergyUnit extends Unit {
  static const String unitType = 'energy';

  EnergyUnit({required super.name, required super.suffix});

  @override
  double? convertTo(Unit toUnit, double originalValue) {
    double? jouleValue;

    switch (name) {
      case 'Joule':
        jouleValue = originalValue;
        break;
      case 'Newton-meter':
        jouleValue = originalValue;
        break;
      case 'Kilojoule':
        jouleValue = preciseMult(originalValue, 1e3);
        break;
      case 'Millijoule':
        jouleValue = preciseMult(originalValue, 1e-3);
        break;
      case 'Microjoule':
        jouleValue = preciseMult(originalValue, 1e-6);
        break;
      case 'Nanojoule':
        jouleValue = preciseMult(originalValue, 1e-9);
        break;
      case 'Attojoule':
        jouleValue = preciseMult(originalValue, 1e-18);
        break;
    }

    double? convertedValue;
    if (jouleValue != null) {
      switch (toUnit.name) {
        case 'Joule':
          convertedValue = jouleValue;
          break;
      }
    }
    return convertedValue;
  }

  @override
  String getUnitType() {
    return unitType;
  }
}
