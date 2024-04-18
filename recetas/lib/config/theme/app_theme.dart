import 'package:flutter/material.dart';

const _customColor = Color.fromARGB(255, 0, 0, 0);

const List<Color> _colorThemes = [
  _customColor,
  Color.fromARGB(255, 58, 114, 111),
  Colors.blue,
  Colors.red,
  Color.fromARGB(255, 116, 189, 33)
];

const List<Color> _colorBackground = [
  _customColor,
  Color.fromARGB(255, 216, 255, 255),
  Color.fromARGB(255, 232, 245, 255),
  Color.fromARGB(255, 255, 225, 255),
  Color.fromARGB(255, 241, 255, 255)
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData themeData() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        scaffoldBackgroundColor: Colors.white,
        listTileTheme: ListTileThemeData(
          tileColor: _colorBackground[selectedColor],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: _colorThemes[selectedColor],
          toolbarTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }
}
