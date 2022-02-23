import 'package:flutter/material.dart';

class MyThemes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );


}

class ThemeProvide extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;
}