abstract class Unit {
  final String name;
  final String suffix;

  Unit({required this.name, required this.suffix});

  double? convertTo(String toUnit, double originalValue);

  String getUnitType();
}
