import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 1})
      : assert(selectedColor < colorList.length, 'Color no disponible'),
        assert(selectedColor >= 0, 'Color debe ser un número positivo');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colorList[selectedColor],
        titleTextStyle: const TextStyle(color: Colors.white),
      ));
}
