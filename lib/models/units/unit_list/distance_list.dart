import '../unit_models/distance_unit.dart';

final List<DistanceUnit> distanceUnits = [
  DistanceUnit(name: 'meter', suffix: 'm', toSIMult: 1),
  DistanceUnit(name: 'decimeter', suffix: 'dm', toSIMult: 1e-1),
  DistanceUnit(name: 'centimeter', suffix: 'cm', toSIMult: 1e-2),
  DistanceUnit(name: 'millimeter', suffix: 'mm', toSIMult: 1e-3),
  DistanceUnit(name: 'micrometer', suffix: 'μm', toSIMult: 1e-6),
  DistanceUnit(name: 'nanometer', suffix: 'nm', toSIMult: 1e-9),
  DistanceUnit(name: 'picometer', suffix: 'pm', toSIMult: 1e-12),
  DistanceUnit(name: 'kilometer', suffix: 'km', toSIMult: 1e3),
  DistanceUnit(name: 'nautical mile', suffix: 'nautical miles', toSIMult: 1852),
  DistanceUnit(name: 'mile', suffix: 'miles', toSIMult: 1609.344),
  DistanceUnit(name: 'yard', suffix: 'yards', toSIMult: 0.9144),
  DistanceUnit(name: 'foot', suffix: 'feet', toSIMult: 0.3048),
  DistanceUnit(name: 'inch', suffix: 'inches', toSIMult: 0.0254),
  DistanceUnit(name: 'astronomical unit', suffix: 'AU', toSIMult: 149597870700),
];
