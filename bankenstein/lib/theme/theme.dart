import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: Color(0xFF711CCC),
      onPrimary: Colors.black,
      secondary: Color.fromARGB(255, 238, 231, 245),
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.black,
      secondary: Colors.grey.shade700,
    ));
