abstract class Unit {
  final String name;
  final String suffix;

  Unit({required this.name, required this.suffix});

  double? convertTo(Unit toUnit, double originalValue);

  String getUnitType();
}
