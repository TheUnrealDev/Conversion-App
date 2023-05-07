import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

const List<Map<String, dynamic>> _units = [
  {
    'value': 'celsius',
    'label': 'Celsius (C°)',
  },
  {
    'value': 'fahrenheit',
    'label': 'Fahrenheit (F°)',
  },
  {
    'value': 'kelvin',
    'label': 'Kelvin (K°)',
  },
];

const TextStyle _drowdownTextStyle = TextStyle(fontSize: 20);

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  String _fromUnit = 'celsius';
  String _toUnit = 'kelvin';

  void swapToAndFromUnits() {
    setState(
      () {
        String temp = _fromUnit;
        _fromUnit = _toUnit;
        _toUnit = temp;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                          style: _drowdownTextStyle,
                          labelText: 'From:',
                          controller: TextEditingController(text: _fromUnit),
                          onChanged: (newValue) {
                            _fromUnit = newValue;
                          },
                          items: _units,
                        ),
                        SelectFormField(
                          style: _drowdownTextStyle,
                          labelText: 'To:',
                          controller: TextEditingController(text: _toUnit),
                          onChanged: (newValue) {
                            _toUnit = newValue;
                          },
                          items: _units,
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
            ],
          ),
        ),
      ),
    );
  }
}
