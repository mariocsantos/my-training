import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blueAccent[400],
  accentColor: Colors.grey[900],
  brightness: Brightness.light,
  backgroundColor: Colors.grey[50],
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.black.withOpacity(0.1),
    filled: true,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.grey[900],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueAccent[400],
    foregroundColor: Colors.white,
  )
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.blueAccent[400],
  accentColor: Colors.white,
  brightness: Brightness.dark,
  backgroundColor: Colors.grey[900],
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white.withOpacity(0.1),
    filled: true,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.grey[900],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueAccent[400],
    foregroundColor: Colors.white,
  )
);
