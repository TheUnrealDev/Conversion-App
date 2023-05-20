import '../unit_models/energy_unit.dart';

final List<EnergyUnit> energyUnits = [
  EnergyUnit(name: 'Joule', suffix: 'J', toSIMult: 1),
  EnergyUnit(name: 'Electron-volt', suffix: 'eV', toSIMult: 1.602176634e-19),
  EnergyUnit(name: 'Newton-meter', suffix: 'Nm', toSIMult: 1),
  EnergyUnit(name: 'Kilojoule', suffix: 'kJ', toSIMult: 1e3),
  EnergyUnit(name: 'Megajoule', suffix: 'MJ', toSIMult: 1e6),
  EnergyUnit(name: 'Millijoule', suffix: 'mJ', toSIMult: 1e-3),
  EnergyUnit(name: 'Microjoule', suffix: 'μJ', toSIMult: 1e-6),
  EnergyUnit(name: 'Nanojoule', suffix: 'nJ', toSIMult: 1e-9),
  EnergyUnit(name: 'Attojoule', suffix: 'aJ', toSIMult: 1e-18),
  EnergyUnit(name: 'Kilocalorie [th]', suffix: 'kcal [th]', toSIMult: 4184),
  EnergyUnit(name: 'Calorie [th]', suffix: 'cal [th]', toSIMult: 4.184),
  EnergyUnit(name: 'Kilocalorie [IT]', suffix: 'kcal [IT]', toSIMult: 4186.8),
  EnergyUnit(name: 'Calorie [IT]', suffix: 'cal [IT]', toSIMult: 4.1868),
  EnergyUnit(name: 'Watt-hour', suffix: 'Wh', toSIMult: 3.6e3),
  EnergyUnit(name: 'Kilowatt-hour', suffix: 'kWh', toSIMult: 3.6e6),
  EnergyUnit(name: 'Megawatt-hour', suffix: 'MWh', toSIMult: 3.6e9),
  EnergyUnit(name: 'Foot-pound', suffix: 'ft lb', toSIMult: 1.3558179483),
  EnergyUnit(name: 'Ton [Explosives]', suffix: 'ton', toSIMult: 4.184e9),
];
