import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitum3/screens/addictions_page.dart';
import 'package:habitum3/screens/calculator_page.dart';
import 'package:habitum3/screens/home.dart';
import 'package:habitum3/screens/negative_habits_page.dart';
import 'package:habitum3/screens/positive_habits_page.dart';
import 'package:habitum3/screens/sign_in_page.dart';
import 'package:habitum3/screens/user_info_page.dart';

import 'bloc/provider.dart';

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
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return Provider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Habitum',
          localizationsDelegates: [
            // ... app-specific localization delegate[s] here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
            const Locale('es', 'ES'), // Arabic, no country code
          ],
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.latoTextTheme(),
          ),
          initialRoute: 'home',
          routes: {
            'signin': (BuildContext context) => SignInPage(),
            'home': (BuildContext context) => Home(),
            'positive': (BuildContext context) => PositivePage(),
            'negative': (BuildContext context) => NegativePage(),
            'calculator': (BuildContext context) => CalculatorPage(),
            'addictions': (BuildContext context) => AddictionsPage(),
            'user': (BuildContext context) => UserInfoPage(),
          }),
    );
  }
}
