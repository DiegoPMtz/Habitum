import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitum3/screens/addictions/addictions_page.dart';
import 'package:habitum3/screens/calculator/calculator_page.dart';
import 'package:habitum3/screens/home/home.dart';
import 'package:habitum3/screens/negative/negative_habits_page.dart';
import 'package:habitum3/screens/positive/positive_habits_page.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habitum',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => Home(),
          'positive': (BuildContext context) => PositivePage(),
          'negative': (BuildContext context) => NegativePage(),
          'calculator': (BuildContext context) => CalculatorPage(),
          'addictions': (BuildContext context) => AddictionsPage(),
        });
  }
}