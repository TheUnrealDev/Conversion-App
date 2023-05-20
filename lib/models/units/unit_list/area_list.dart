import '../unit_models/area_unit.dart';

final List<AreaUnit> areaUnits = [
  AreaUnit(name: 'Square meter', suffix: 'm²', toSIMult: 1),
  AreaUnit(name: 'Square kilometer', suffix: 'km²', toSIMult: 1e6),
  AreaUnit(name: 'Square decimeter', suffix: 'dm²', toSIMult: 1e-2),
  AreaUnit(name: 'Square centimeter', suffix: 'cm²', toSIMult: 1e-4),
  AreaUnit(name: 'Square millimeter', suffix: 'mm²', toSIMult: 1e-6),
  AreaUnit(name: 'Square micrometer', suffix: 'μm²', toSIMult: 1e-12),
  AreaUnit(name: 'Hectare', suffix: 'ha', toSIMult: 10000),
  AreaUnit(name: 'Acre', suffix: 'ac', toSIMult: 4046.8564224),
  AreaUnit(name: 'Square mile', suffix: 'mi²', toSIMult: 2589988.1103359724),
  AreaUnit(name: 'Square yard', suffix: 'yd²', toSIMult: 0.83612736),
  AreaUnit(name: 'Square foot', suffix: 'ft²', toSIMult: 0.09290304),
  AreaUnit(name: 'Square inch', suffix: 'in²', toSIMult: 0.00064516),
];
