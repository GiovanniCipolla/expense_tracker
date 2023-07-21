import 'package:exspense_tracker/theme_settings.dart';
import 'package:exspense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 29, 83, 176));

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 56, 70));

void main() {
  WidgetsFlutterBinding.ensureInitialized();      
 
  runApp(
      MaterialApp(
        darkTheme:getDarkThemeData(),
        theme: getLightThemeData(),
        themeMode: ThemeMode.system, // dark o light
        home: const Expenses(),
      ),
    );
}