import '../unit_models/volume_unit.dart';

final List<VolumeUnit> volumeUnits = [
  VolumeUnit(name: 'Liter', suffix: 'l', toSIMult: 1e-3),
  VolumeUnit(name: 'Cubic meter', suffix: 'm³', toSIMult: 1),
  VolumeUnit(name: 'Cubic decimeter', suffix: 'dm³', toSIMult: 1e-3),
  VolumeUnit(name: 'Cubic centimeter', suffix: 'cm³', toSIMult: 1e-6),
  VolumeUnit(name: 'Cubic millimeter', suffix: 'mm³', toSIMult: 1e-9),
  VolumeUnit(name: 'Deciliter', suffix: 'dl', toSIMult: 1e-4),
  VolumeUnit(name: 'Centiliter', suffix: 'cl', toSIMult: 1e-5),
  VolumeUnit(name: 'Milliliter', suffix: 'ml', toSIMult: 1e-6),
  VolumeUnit(
      name: 'Cubic inch', suffix: 'cubic inches', toSIMult: 1.6387064e-5),
  VolumeUnit(name: 'Pint [US]', suffix: 'pints', toSIMult: 0.000473176473),
  VolumeUnit(name: 'Gallon [US]', suffix: 'gallons', toSIMult: 0.003785411784),
  VolumeUnit(
      name: 'Ounce [US]', suffix: 'fl. oz.', toSIMult: (1 / 33814.022701843)),
  VolumeUnit(name: 'Cup [Metric]', suffix: 'cups', toSIMult: 2.5e-4),
];
