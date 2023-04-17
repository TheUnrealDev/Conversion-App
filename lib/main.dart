import 'package:conversion_app/temperature_page.dart';
import 'package:flutter/material.dart';
import 'package:conversion_app/home_page.dart';
import 'package:conversion_app/conversion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversion App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(title: "Conversion App"),
      debugShowCheckedModeBanner: false,
    );
  }
}
