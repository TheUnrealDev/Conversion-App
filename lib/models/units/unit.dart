abstract class Unit {
  final String name;
  final String suffix;
  final double toSIMult;

  Unit({required this.name, required this.suffix, this.toSIMult = 0});

  double? convertTo(Unit toUnit, double originalValue);

  String getUnitType();
}
