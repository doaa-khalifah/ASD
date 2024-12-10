import 'package:flutter/material.dart';
import 'package:was_autism_spectrum_disorder/login_screen.dart';
import 'package:was_autism_spectrum_disorder/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:was_autism_spectrum_disorder/child_dashboard.dart'; // Correct import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autism Spectrum Disorder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: const LoginScreen(),
      routes: {
        '/child_dashboard': (context) => ChildDashboard(),
        // Add other routes here if needed
      },
    );
  }
}
