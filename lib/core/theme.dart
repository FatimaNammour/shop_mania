import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData themeData = ThemeData(
    primaryColor: ConstColors.primary,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: ConstColors.displayLarge,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: ConstColors.displayMedium,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        color: ConstColors.displayMedium,
        fontSize: 15,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 20, color: ConstColors.primary)),
            foregroundColor:
                WidgetStateProperty.all<Color>(ConstColors.primary))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 50)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(color: ConstColors.white, fontSize: 20)),
        foregroundColor: WidgetStateProperty.all<Color>(ConstColors.white),
        backgroundColor: WidgetStateProperty.all<Color>(ConstColors.primary),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        side: const BorderSide(
          // width: 10,
          color: ConstColors.displayMedium,
        ),
        textStyle:
            const TextStyle(color: ConstColors.displayLarge, fontSize: 20),
        foregroundColor: ConstColors.displayLarge,
        backgroundColor: ConstColors.white,
      ),
    ),
  );
}

class ConstColors {
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color displayLarge = Colors.black;
  static const Color displayMedium = Color(0xffB3B8C4);
  static const Color fieldFilled = Color(0xffF3F4F7);

  static const Color primary = Color(0xff514EB7);
}
