import 'package:flutter/material.dart';

class ThemeBank {
  ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.green[900],
      accentColor: Colors.blueAccent[700],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent[700],
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
