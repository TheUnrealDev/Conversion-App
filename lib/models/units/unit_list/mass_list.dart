import '../unit_models/mass_unit.dart';

final List<MassUnit> massUnits = [
  MassUnit(name: 'Kilogram', suffix: 'kg', toSIMult: 1),
  MassUnit(name: 'Gram', suffix: 'g', toSIMult: 1e-3),
  MassUnit(name: 'Milligram', suffix: 'g', toSIMult: 1e-6),
  MassUnit(name: 'Microgram', suffix: 'μg', toSIMult: 1e-9),
  MassUnit(name: 'Ton [Metric]', suffix: 't [Metric]', toSIMult: 1e3),
  MassUnit(name: 'Ton [US]', suffix: 'ton [US]', toSIMult: 907.18474),
  MassUnit(name: 'Ton [UK]', suffix: 'ton [UK]', toSIMult: 1016.0469088),
  MassUnit(name: 'Tonne', suffix: 'tonne', toSIMult: 1e3),
  MassUnit(name: 'Pound', suffix: 'lbs', toSIMult: 0.45359237),
  MassUnit(name: 'Ounce', suffix: 'oz', toSIMult: 0.028349523125),
  MassUnit(name: 'Carat', suffix: 'ct', toSIMult: 0.0002),
  MassUnit(name: 'Atomic mass unit', suffix: 'u', toSIMult: 1.660538921e-27),
  MassUnit(name: 'Electron mass', suffix: 'mₑ', toSIMult: 9.1093837015e-31),
  MassUnit(name: 'Proton mass', suffix: 'mₚ', toSIMult: 1.672622e-27),
  MassUnit(name: 'Neutron mass', suffix: 'mₙ', toSIMult: 1.674927e-27),
  MassUnit(name: 'Earth mass', suffix: 'Earth mass', toSIMult: 5.976e24),
  MassUnit(name: 'Stone [US]', suffix: 'stone [US]', toSIMult: 5.669904625),
  MassUnit(name: 'Stone [UK]', suffix: 'stone [UK]', toSIMult: 6.35029318),
];
