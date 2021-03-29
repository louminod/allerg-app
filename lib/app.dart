import 'package:allergie/screens/home/HomeScreen.dart';
import 'package:allergie/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(Constants.ORIENTATIONS_ALLOWED);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('fr', 'FR')],
    );
  }
}
