import 'package:flutter/material.dart';
import 'theme_info.dart';

final List<ThemeInfo> themeList = [
  ThemeInfo(
    'Green',
    ThemeData(
      primarySwatch: Colors.green,
    ),
  ),
  ThemeInfo(
    'Red',
    ThemeData(
      primarySwatch: Colors.red,
    ),
  ),
  ThemeInfo(
    'Blue',
    ThemeData(
      primarySwatch: Colors.blue,
    ),
  ),
  ThemeInfo(
    'Dark Blue',
    ThemeData(
      primarySwatch: Colors.indigo,
    ),
  ),
  ThemeInfo(
    'Amber',
    ThemeData(
      primarySwatch: Colors.amber,
    ),
  ),
  ThemeInfo(
    'Purple',
    ThemeData(
      primarySwatch: Colors.purple,
    ),
  ),
  ThemeInfo(
    'Teal',
    ThemeData(
      primarySwatch: Colors.teal,
    ),
  ),
];

final List<Map<String, dynamic>> selectableThemes = [
  for (var themeInfo in themeList) getMapFromThemeInfo(themeInfo)
];

Map<String, dynamic> getMapFromThemeInfo(ThemeInfo themeInfo) {
  return {'value': themeInfo.themeName, 'label': themeInfo.themeName};
}

ThemeData getDefaultTheme() {
  ThemeData defaultTheme;

  if (themeList.isNotEmpty) {
    defaultTheme = themeList.first.theme;
  } else {
    defaultTheme = ThemeData();
  }
  return defaultTheme;
}

String getThemeNameFromThemeData(ThemeData theme) {
  String themeName = "Unknown";

  for (ThemeInfo themeInfo in themeList) {
    if (themeInfo.theme.primaryColor == theme.primaryColor) {
      themeName = themeInfo.themeName;
      break;
    }
  }
  return themeName;
}

ThemeData? getThemeFromThemeName(String themeName) {
  ThemeData? theme;
  for (ThemeInfo themeInfo in themeList) {
    if (themeInfo.themeName == themeName) {
      theme = themeInfo.theme;
      break;
    }
  }
  return theme;
}
