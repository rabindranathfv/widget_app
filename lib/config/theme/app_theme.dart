import 'package:flutter/material.dart';

const colorlist = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.red,
  Colors.purple,
  Colors.pink,
  Colors.brown,
  Colors.grey,
  Colors.black,
  Colors.white
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colorlist.length,
            'selectedColor must be between 0 and ${colorlist.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorlist[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
