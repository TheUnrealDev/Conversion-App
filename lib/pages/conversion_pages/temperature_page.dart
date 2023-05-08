import 'package:conversion_app/unit_converter.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:conversion_app/number_validator.dart';
import '../../units.dart';
import 'package:flutter/material.dart';

const String unitType = 'temperature';

final List<Map<String, dynamic>> _units = getUnitInfoMapOfType(unitType);

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final _formKey = GlobalKey<FormState>();

  final TextStyle _dropdownTextStyle = const TextStyle(fontSize: 20);
  final _valueToConvertController = TextEditingController();

  String _fromUnit = _units.isEmpty ? '' : _units.elementAt(0)['value'];
  String _toUnit = _units.length < 2 ? '' : _units.elementAt(1)['value'];
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

  void convertChosenUnits() {
    double valueToConvert = double.parse(_valueToConvertController.text);
    double? convertedValue = convertUnits(_fromUnit, _toUnit, valueToConvert);

    String displayString = "There was an error with your conversion!";
    if (convertedValue != null) {
      displayString = '$convertedValue ${getUnitSuffixFromName(_toUnit)}';
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
                          style: _dropdownTextStyle,
                          labelText: "From",
                          controller: TextEditingController(text: _fromUnit),
                          onChanged: setFromUnit,
                          items: _units,
                        ),
                        TextFormField(
                          key: const Key('ValueToConvert'),
                          validator: NumberValidator.validateNumber,
                          controller: _valueToConvertController,
                          decoration: const InputDecoration(
                              hintText: 'Input your number.'),
                          onChanged: (value) {
                            validateFormAndConvert();
                          },
                        ),
                        SelectFormField(
                          style: _dropdownTextStyle,
                          labelText: "To",
                          controller: TextEditingController(text: _toUnit),
                          onChanged: setToUnit,
                          items: _units,
                        ),
                        Text(_convertedUnitString),
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
            ],
          ),
        ),
      ),
    );
  }
}
