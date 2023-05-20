import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import '../../models/number_validator.dart';
import '../../models/unit_converter.dart';
import '../../models/units/units.dart';

class ConversionForm extends StatefulWidget {
  final String unitType;
  final List<Map<String, dynamic>> units;
  ConversionForm({super.key, required this.unitType})
      : units = getUnitInfoMapOfType(unitType);

  @override
  State<ConversionForm> createState() => _ConversionFormState();
}

class _ConversionFormState extends State<ConversionForm> {
  final _formKey = GlobalKey<FormState>();

  final TextStyle _dropdownTextStyle = const TextStyle(fontSize: 20);
  final TextStyle _resultTextStyle = const TextStyle(fontSize: 20);
  final _valueToConvertController = TextEditingController();

  late String _fromUnit =
      widget.units.isEmpty ? '' : widget.units.elementAt(0)['value'];
  late String _toUnit =
      widget.units.length < 2 ? '' : widget.units.elementAt(1)['value'];
  String _convertedUnitString = '';

  void swapToAndFromUnits() {
    setState(
      () {
        String temp = _fromUnit;
        _fromUnit = _toUnit;
        _toUnit = temp;
      },
    );
  }

  void setFromUnit(String newUnit) {
    setState(() {
      _fromUnit = newUnit;
    });
  }

  void setToUnit(String newUnit) {
    setState(() {
      _toUnit = newUnit;
    });
  }

  bool shouldBeNotation(double convertedAbsValue) {
    bool shouldBeNotation = false;

    if (convertedAbsValue >= 1e6) {
      shouldBeNotation = true;
    } else if (convertedAbsValue > 0 && convertedAbsValue < 1e-6) {
      shouldBeNotation = true;
    }

    return shouldBeNotation;
  }

  void convertChosenUnits() {
    double valueToConvert = double.parse(_valueToConvertController.text);
    double? convertedValue = convertUnits(_fromUnit, _toUnit, valueToConvert);

    String displayString = "There was an error with your conversion!";
    if (convertedValue != null) {
      String resultString;
      if (shouldBeNotation(convertedValue.abs())) {
        resultString = convertedValue.toStringAsExponential();
      } else {
        resultString = convertedValue.toString();
      }
      displayString = '$resultString ${getUnitSuffixFromName(_toUnit)}';
    }

    setState(
      () {
        _convertedUnitString = displayString;
      },
    );
  }

  void validateFormAndConvert() {
    if (_formKey.currentState == null) {
      return;
    }
    bool isValidForm = _formKey.currentState!.validate();
    if (!isValidForm) {
      return;
    }
    convertChosenUnits();
  }

  @override
  Widget build(BuildContext context) {
    final Icon drowDownSuffix = Icon(
      Icons.arrow_drop_down,
      color: Theme.of(context).primaryColor,
    );

    validateFormAndConvert();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        SelectFormField(
                          enabled: widget.units.isNotEmpty,
                          style: _dropdownTextStyle,
                          type: widget.units.length <= 8
                              ? SelectFormFieldType.dropdown
                              : SelectFormFieldType.dialog,
                          decoration: InputDecoration(suffix: drowDownSuffix),
                          labelText: "From",
                          controller: TextEditingController(text: _fromUnit),
                          onChanged: setFromUnit,
                          items: widget.units,
                        ),
                        TextFormField(
                          validator: NumberValidator.validateNumber,
                          controller: _valueToConvertController,
                          decoration: const InputDecoration(
                              hintText: 'Input your number.'),
                          onChanged: (value) {
                            validateFormAndConvert();
                          },
                        ),
                        SelectFormField(
                          enabled: widget.units.isNotEmpty,
                          style: _dropdownTextStyle,
                          type: widget.units.length <= 8
                              ? SelectFormFieldType.dropdown
                              : SelectFormFieldType.dialog,
                          decoration: InputDecoration(suffix: drowDownSuffix),
                          labelText: "To",
                          controller: TextEditingController(text: _toUnit),
                          onChanged: setToUnit,
                          items: widget.units,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: swapToAndFromUnits,
                      child: const Icon(Icons.swap_vert),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Visibility(
                  visible: _convertedUnitString.isNotEmpty &&
                      _valueToConvertController.text.isNotEmpty,
                  child: Column(
                    children: [
                      Text(
                        '${_valueToConvertController.text} ${getUnitSuffixFromName(_fromUnit)}',
                        textAlign: TextAlign.right,
                        style: _resultTextStyle,
                      ),
                      Text(
                        '=',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).primaryColor),
                      ),
                      Text(
                        _convertedUnitString,
                        textAlign: TextAlign.left,
                        style: _resultTextStyle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
