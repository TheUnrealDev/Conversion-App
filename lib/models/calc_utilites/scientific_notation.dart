class ScientificNotation {
  double value = 0;

  double factor = 0;
  int exponent = 0;

  ScientificNotation(this.value) {
    String scientificString = value.toStringAsExponential();
    List<String> components = scientificString.split("e");

    if (components.length == 2) {
      factor = double.parse(components[0]);
      exponent = int.parse(components[1]);
    }
  }

  void multiply(ScientificNotation otherNum) {
    factor *= otherNum.factor;
    exponent += otherNum.exponent;
  }

  void divide(ScientificNotation otherNum) {
    factor /= otherNum.factor;
    exponent -= otherNum.exponent;
  }

  double parseAsDouble() {
    List<String> components = [factor.toString(), exponent.toString()];
    String numberString = components.join("e");
    return double.parse(numberString);
  }
}
