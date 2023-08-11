import 'package:conversion_app/main.dart';
import 'package:conversion_app/models/settings_data/themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = getDefaultTheme();

  ThemeProvider(BuildContext context) {
    applySavedTheme();
  }

  void applySavedTheme() {
    String? savedThemeName = MyApp.mainPrefs?.getString('UserTheme');
    if (savedThemeName == null) {
      return;
    }
    ThemeData? savedTheme = getThemeFromThemeName(savedThemeName);
    if (savedTheme == null) {
      return;
    }
    debugPrint('Loaded ' + savedThemeName);
    _theme = savedTheme;
  }

  void saveTheme(ThemeData newTheme) {
    String themeName = getThemeNameFromThemeData(newTheme);
    MyApp.mainPrefs?.setString('UserTheme', themeName);
    debugPrint('Saved ' + themeName);
  }

  void changeTheme(ThemeData newTheme) {
    saveTheme(newTheme);
    _theme = newTheme;
    notifyListeners();
  }

  ThemeData getTheme() {
    return _theme;
  }
}
