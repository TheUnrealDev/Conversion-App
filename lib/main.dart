import 'package:conversion_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:conversion_app/views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/units/units.dart';

void main() async {
  initializeUnits();
  WidgetsFlutterBinding.ensureInitialized();

  Future<SharedPreferences> futurePrefs = SharedPreferences.getInstance();
  SharedPreferences mainPrefs = await futurePrefs;

  MyApp app = MyApp(
    prefs: mainPrefs,
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  static late SharedPreferences? mainPrefs;

  MyApp({super.key, prefs}) {
    mainPrefs = prefs;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeProvider(context)),
      ],
      builder: (context, child) {
        final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Conversion App',
          theme: themeProvider.getTheme(),
          home: const HomePage(title: "Conversion App"),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
