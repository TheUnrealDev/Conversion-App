import 'package:flutter/material.dart';
import 'package:conversion_app/home_page.dart';
import 'package:conversion_app/conversion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversion App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ConversionPage(
        pageTitle: "Temperature",
        pageIcon: Icons.thermostat_outlined,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
