import 'package:expense_tracker/widget/expense/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 250, 192, 255));
var darkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 207, 168));
var cardColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 229, 217, 234));
var textColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 128, 128, 128));
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: darkColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: darkColorScheme.primaryContainer,
            foregroundColor: darkColorScheme.onPrimaryContainer,
          ))),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: cardColorScheme.primaryContainer,
          margin: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.secondaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: textColorScheme.onPrimaryContainer,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: textColorScheme.onSecondaryContainer,
              ),
              bodyMedium: TextStyle(
                fontSize: 16,
                color: textColorScheme.onSecondaryContainer,
              ),
            ),
      ),
      home: const Expenses(),
    ));
  });
}
