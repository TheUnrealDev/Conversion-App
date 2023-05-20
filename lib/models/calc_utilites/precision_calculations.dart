import 'dart:math';

import 'package:flutter/material.dart';

import 'scientific_notation.dart';

double preciseMult(double originalValue, double otherValue) {
  ScientificNotation notation = ScientificNotation(originalValue);
  ScientificNotation otherNotation = ScientificNotation(otherValue);

  notation.multiply(otherNotation);

  return notation.parseAsDouble();
}

double preciseDivision(double originalValue, double otherValue) {
  ScientificNotation notation = ScientificNotation(originalValue);
  ScientificNotation otherNotation = ScientificNotation(otherValue);

  notation.divide(otherNotation);

  return notation.parseAsDouble();
}

double roundToNumDecimals(double number, int numDecimals) {
  ScientificNotation notation = ScientificNotation(number);

  double roundMult = pow(10, numDecimals).toDouble();

  double multipliedFactor =
      preciseMult(notation.factor, roundMult).roundToDouble();
  double roundedFactor = preciseDivision(multipliedFactor, roundMult);

  notation.factor = roundedFactor;

  return notation.parseAsDouble();
}
