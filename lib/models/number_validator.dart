class NumberValidator {
  const NumberValidator();

  static String? validateNumber(String? string) {
    double number;

    if (string == null || string.isEmpty) {
      return 'Input a number!';
    }

    try {
      number = double.parse(string);
    } catch (e) {
      return 'Use scientific notation. \nEx. 6.022e23';
    }

    if (number >= 1e200) {
      return 'Your number is too large!';
    }

    return null;
  }
}
