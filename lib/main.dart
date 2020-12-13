import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitum3/src/components/custom_widgets.dart';
import 'package:habitum3/src/screens/habits.dart';

void main() {
  // final prefs = new PreferenciasUsuario();
  // await prefs.initPrefs();
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
    return Provider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Habitum',
          localizationsDelegates: [
            // ... app-specific localization delegate[s] here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
            const Locale('es', 'ES'), // Arabic, no country code
            const Locale.fromSubtags(
                languageCode: 'zh'), // Chinese *See Advanced Locales below*
            // ... other locales the app supports
          ],
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.latoTextTheme(),
          ),
          initialRoute: 'habits',
          routes: {
            'signin': (BuildContext context) => SignInPage(),
            'home': (BuildContext context) => Home(),
            'positive': (BuildContext context) => PositivePage(),
            'negative': (BuildContext context) => NegativePage(),
            'calculator': (BuildContext context) => CalculatorPage(),
            'addictions': (BuildContext context) => AddictionsPage(),
            'user': (BuildContext context) => UserInfoPage(),
            'habits': (BuildContext context) => Habits(),
          }),
    );
  }
}
