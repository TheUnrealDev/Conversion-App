import '../unit_models/time_unit.dart';

final List<TimeUnit> timeUnits = [
  TimeUnit(name: 'Second', suffix: 's', toSIMult: 1),
  TimeUnit(name: 'Millisecond', suffix: 'ms', toSIMult: 1e-3),
  TimeUnit(name: 'Microsecond', suffix: 'μs', toSIMult: 1e-6),
  TimeUnit(name: 'Nanosecond', suffix: 'ns', toSIMult: 1e-9),
  TimeUnit(name: 'Minute', suffix: 'min', toSIMult: 60),
  TimeUnit(name: 'Hour', suffix: 'h', toSIMult: 3600),
  TimeUnit(name: 'Day', suffix: 'd', toSIMult: 86400),
  TimeUnit(name: 'Week', suffix: 'weeks', toSIMult: 604800),
  TimeUnit(name: 'Month', suffix: 'months', toSIMult: 2628000),
  TimeUnit(name: 'Year', suffix: 'y', toSIMult: 3.15576e7),
  TimeUnit(name: 'Decade', suffix: 'decades', toSIMult: 3.15576e8),
  TimeUnit(name: 'Century', suffix: 'centuries', toSIMult: 3.15576e9),
  TimeUnit(name: 'Millennium', suffix: 'millennia', toSIMult: 3.15576e10),
  TimeUnit(name: 'Fortnight', suffix: 'fortnights', toSIMult: 1209600),
];
