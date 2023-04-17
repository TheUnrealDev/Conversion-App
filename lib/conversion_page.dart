import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  final String pageTitle;
  final IconData pageIcon;
  const ConversionPage(
      {super.key, required this.pageTitle, required this.pageIcon});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  @override
  Widget build(BuildContext context) {
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
              color: Theme.of(context).primaryColorLight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(widget.pageIcon, size: 35),
                  ),
                  Text(
                    widget.pageTitle,
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
