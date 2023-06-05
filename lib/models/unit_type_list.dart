import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/conversion_page.dart';
import 'page_data.dart';

List<PageData> pageDataList = [
  PageData(
    unitType: 'temperature',
    title: 'Temperature',
    icon: Icons.thermostat_outlined,
  ),
  PageData(
    unitType: 'volume',
    title: 'Volume',
    icon: Icons.coffee_rounded,
  ),
  PageData(
    unitType: 'distance',
    title: 'Distance',
    icon: Icons.height,
  ),
  PageData(
    unitType: 'energy',
    title: 'Energy',
    icon: Icons.bolt,
  ),
  PageData(
    unitType: 'velocity',
    title: 'Velocity',
    icon: Icons.speed,
  ),
  PageData(
    unitType: 'mass',
    title: 'Mass',
    icon: Icons.scale,
  ),
  PageData(
    unitType: 'area',
    title: 'Area',
    icon: Icons.square_outlined,
  ),
  PageData(
    unitType: 'time',
    title: 'Time',
    icon: Icons.alarm,
  ),
];

late Map<PageData, int> pageUsage;

class UnitTypeList extends StatefulWidget {
  const UnitTypeList({super.key});

  @override
  State<UnitTypeList> createState() => _UnitTypeListState();
}

class _UnitTypeListState extends State<UnitTypeList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isLoading = true;
  int _highestConversionCount = 0;

  Future<Map<PageData, int>> loadPageUsage() async {
    SharedPreferences prefs = await _prefs;

    Map<PageData, int> pageUsageFromPrefs = Map();
    for (PageData pageData in pageDataList) {
      int timesUsed = prefs.getInt(pageData.unitType) ?? 0;

      if (timesUsed > _highestConversionCount) {
        _highestConversionCount = timesUsed;
      }

      pageUsageFromPrefs[pageData] = timesUsed;
    }
    return pageUsageFromPrefs;
  }

  void sortPageDataByUsage({loadFromPrefs = false}) async {
    if (loadFromPrefs) {
      pageUsage = await loadPageUsage();
    }

    List<PageData> sortedPageData = pageUsage.keys.toList(growable: false)
      ..sort((a, b) => (pageUsage[b] ?? 0).compareTo(pageUsage[a] ?? 0));

    setState(() {
      isLoading = false;
      pageDataList = sortedPageData;
    });
  }

  void updatePageUsage(unitType, newUsageCount) {
    for (PageData pageData in pageUsage.keys) {
      if (pageData.unitType == unitType) {
        pageUsage[pageData] = newUsageCount;
        break;
      }
    }
    if (_highestConversionCount < 1) {
      _highestConversionCount = 1;
    }
  }

  @override
  void initState() {
    super.initState();
    sortPageDataByUsage(loadFromPrefs: true);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Expanded(
            flex: 1,
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
                          unitType: pageInfo.unitType,
                          title: pageInfo.title,
                          icon: pageInfo.icon,
                          updateUsageCallback: updatePageUsage,
                        );
                      }),
                    ).then(
                      (value) => {
                        setState(() {
                          sortPageDataByUsage();
                        })
                      },
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
                  subtitle: (index > 0 || _highestConversionCount < 1)
                      ? null
                      : Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.green,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Your most used conversion!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                        ),
                  contentPadding: const EdgeInsets.all(20),
                );
              },
            ),
          );
  }
}
