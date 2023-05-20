import '../unit_models/velocity_unit.dart';

final List<VelocityUnit> velocityUnits = [
  VelocityUnit(name: 'Meter/second', suffix: 'm/s', toSIMult: 1),
  VelocityUnit(name: 'Kilometer/hour', suffix: 'km/h', toSIMult: (1 / 3.6)),
  VelocityUnit(name: 'Mile/hour', suffix: 'mi/h', toSIMult: 0.44704),
  VelocityUnit(name: 'Knot', suffix: 'knots', toSIMult: 0.5144444444444519),
  VelocityUnit(
      name: 'Knot - UK', suffix: 'knots (UK)', toSIMult: 0.514773333333342),
  VelocityUnit(
      name: 'Mach (20°C, 1 atm)',
      suffix: 'Mach [20°C, 1 atm]',
      toSIMult: 343.6),
  VelocityUnit(
      name: 'Mach (SI standard)', suffix: 'Mach - SI', toSIMult: 295.0464),
  VelocityUnit(
      name: 'Speed of light (vacuum)', suffix: 'c', toSIMult: 299792458),
];
