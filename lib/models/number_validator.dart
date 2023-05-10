class NumberValidator {
  const NumberValidator();

  static String? validateNumber(String? string) {
    if (string == null || string.isEmpty) {
      return 'Input a number!';
    }
    try {
      double.parse(string);
      return null;
    } catch (e) {
      return 'Use scientific notation. \nEx. 6.022e23';
    }
  }
}
