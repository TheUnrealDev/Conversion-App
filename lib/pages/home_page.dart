import 'package:conversion_app/pages/conversion_page.dart';
import 'package:conversion_app/page_data.dart';
import 'package:flutter/material.dart';

List<PageData> pageDataList = [
  PageData(
    tag: 'temperature',
    title: 'Temperature',
    icon: Icons.thermostat_outlined,
  ),
  PageData(
    tag: 'volume',
    title: 'Volume',
    icon: Icons.coffee_rounded,
  ),
  PageData(
    tag: 'distance',
    title: 'Distance',
    icon: Icons.height,
  ),
  PageData(
    tag: 'energy',
    title: 'Energy',
    icon: Icons.bolt,
  ),
  PageData(
    tag: 'velocity',
    title: 'Velocity',
    icon: Icons.speed,
  ),
  PageData(
    tag: 'mass',
    title: 'Mass',
    icon: Icons.scale,
  ),
  PageData(
    tag: 'area',
    title: 'Area',
    icon: Icons.square_outlined,
  ),
  PageData(
    tag: 'time',
    title: 'Time',
    icon: Icons.alarm,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              itemCount: pageDataList.length,
              itemBuilder: (context, int index) {
                PageData pageInfo = pageDataList[index];
                return ListTile(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ConversionPage(
                          tag: pageInfo.tag,
                          title: pageInfo.title,
                          icon: pageInfo.icon,
                        );
                      }),
                    )
                  },
                  leading: Hero(
                    tag: "${pageInfo.title} icon",
                    child: Icon(
                      pageInfo.icon,
                      color: Theme.of(context).primaryColorDark,
                      size: 40,
                    ),
                  ),
                  title: Hero(
                    tag: "${pageInfo.title} title",
                    child: Text(
                      pageInfo.title,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(20),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
