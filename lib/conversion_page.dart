import 'package:conversion_app/temperature_page.dart';
import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  final String title;
  final IconData icon;
  const ConversionPage({super.key, required this.title, required this.icon});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  @override
  Widget build(BuildContext context) {
    Widget pageContent;
    switch (widget.title) {
      case "Temperature":
        pageContent = const TemperaturePage();
        break;
      default:
        pageContent = Container();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).secondaryHeaderColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(widget.icon, size: 35),
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: pageContent,
          ),
        ],
      ),
    );
  }
}
