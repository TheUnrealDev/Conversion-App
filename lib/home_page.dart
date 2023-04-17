import 'package:conversion_app/conversion_page.dart';
import 'package:conversion_app/page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PageData> pageData = [
    PageData(title: "Temperature", icon: Icons.thermostat_outlined),
    PageData(title: "Volume", icon: Icons.coffee_rounded),
    PageData(title: "Length", icon: Icons.height),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
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
              child: const Center(
                child: Text(
                  "Select which conversion you want to do!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: ListView.builder(
                  itemCount: pageData.length,
                  itemBuilder: (context, int index) {
                    PageData pageInfo = pageData[index];
                    return ListTile(
                      onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ConversionPage(
                              title: pageInfo.title, icon: pageInfo.icon);
                        }))
                      },
                      leading: Icon(
                        pageInfo.icon,
                        color: Theme.of(context).primaryColorDark,
                        size: 40,
                      ),
                      title: Text(
                        pageInfo.title,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(15),
                    );
                  })
              /*child: ListView.builder(itemBuilder: (context, int index) {
              return ListTile(
                onTap: () => {Navigator.push(context, ConversionPage())},
                leading: Icon(
                  Icons.thermostat_outlined,
                  color: Theme.of(context).primaryColorDark,
                  size: 40,
                ),
                title: Text(
                  "Temperature",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                contentPadding: const EdgeInsets.all(15),
              );
            }),*/
              ),
        ],
      ),
    );
  }
}
