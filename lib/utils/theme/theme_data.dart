import 'package:flutter/material.dart';

class AppTheme{

  ThemeData themeData = ThemeData(
    hintColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      )

  );

  ThemeData lightTheme = ThemeData(
      hintColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));
}