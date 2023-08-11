import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_data/themes.dart';
import '../models/settings_data/theme_info.dart';
import '../providers/theme_provider.dart';

class ThemeSelectionDialog extends StatelessWidget {
  const ThemeSelectionDialog({super.key});

  void switchTheme(BuildContext context, ThemeData newTheme) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.changeTheme(newTheme);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 500,
        child: GridView.builder(
          itemCount: themeList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            ThemeInfo themeInfo = themeList[index];
            return TextButton(
              onPressed: () {
                switchTheme(context, themeInfo.theme);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeInfo.theme.primaryColor),
                height: 50,
                width: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
