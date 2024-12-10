// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:was_autism_spectrum_disorder/localization.dart';

class UserSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.translate('app_title') ?? 'User Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              localizations?.translate('welcome_message') ??
                  'Welcome to the Autism Spectrum Disorder App',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle parent selection
              },
              child: Text(localizations?.translate('parent') ?? 'Parent'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle child selection
              },
              child: Text(localizations?.translate('child') ?? 'Child'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle psychologist selection
              },
              child: Text(
                  localizations?.translate('psychologist') ?? 'Psychologist'),
            ),
          ],
        ),
      ),
    );
  }
}
