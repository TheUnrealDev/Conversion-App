import 'package:conversion_app/models/select_theme_dialog.dart';
import 'package:flutter/material.dart';
import '../models/settings_data/themes.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeData? _newSelectedTheme;
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    String currentThemeName = getThemeNameFromThemeData(currentTheme);

    String _nameDisplayText = '';
    if (currentThemeName != 'Unknown') {
      _nameDisplayText = currentThemeName;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _newSelectedTheme == null
            ? Theme.of(context).primaryColor
            : _newSelectedTheme?.primaryColor,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Select App Theme"),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => ThemeSelectionDialog());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Current Theme",
                        style: TextStyle(
                          color: currentTheme.hintColor,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 50,
                      ),
                      Text(_nameDisplayText),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: currentTheme.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                )
                /*SelectFormField(
                  initialValue: getThemeNameFromThemeData(Theme.of(context)),
                  type: SelectFormFieldType.dialog,
                  items: selectableThemes,
                  onChanged: (newThemeName) {
                    ThemeData? newTheme = getThemeFromThemeName(newThemeName);
                    if (newTheme != null) {
                      themeProvider.changeTheme(newTheme);
                    }
                  },
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
