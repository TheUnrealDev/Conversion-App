import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:conversion_app/views/home_page.dart';
import 'models/units/units.dart';

void main() {
  initializeUnits();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MaterialApp(
      title: 'Conversion App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(title: "Conversion App"),
      debugShowCheckedModeBanner: false,
    );
  }
}
