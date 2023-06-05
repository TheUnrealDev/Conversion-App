import 'package:flutter/material.dart';
import 'conversion_form.dart';

class ConversionPage extends StatefulWidget {
  final String unitType;
  final String title;
  final IconData icon;
  final Function updateUsageCallback;
  const ConversionPage(
      {super.key,
      required this.unitType,
      required this.title,
      required this.icon,
      required this.updateUsageCallback});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  @override
  Widget build(BuildContext context) {
    Widget pageContent = ConversionForm(
      unitType: widget.unitType,
      updateUsageCallback: widget.updateUsageCallback,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    child: Hero(
                      tag: "${widget.title} icon",
                      child: Icon(widget.icon, size: 35),
                    ),
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
