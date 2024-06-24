import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData themeData = ThemeData(
    primaryColor: ConstColors.primary,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: ConstColors.displayLarge,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: ConstColors.displaySmall,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: ConstColors.displayMedium,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: ConstColors.displaySmall,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        color: ConstColors.displaySmall,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: ConstColors.displayLarge,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16, color: ConstColors.primary)),
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
            const TextStyle(color: ConstColors.white, fontSize: 16)),
        foregroundColor: WidgetStateProperty.all<Color>(ConstColors.white),
        backgroundColor: WidgetStateProperty.all<Color>(ConstColors.primary),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        side: const BorderSide(
          // width: 10,
          color: ConstColors.displaySmall,
        ),
        textStyle: const TextStyle(
            color: ConstColors.displayLarge,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        foregroundColor: ConstColors.displayLarge,
        backgroundColor: ConstColors.white,
      ),
    ),
    scaffoldBackgroundColor: ConstColors.white,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ConstColors.white,
      dragHandleColor: ConstColors.displaySmall,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: ConstColors.white,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ConstColors.displayMedium,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: IconThemeData(size: 25)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: ConstColors.white,
        unselectedLabelStyle: TextStyle(color: ConstColors.displaySmall),
        selectedLabelStyle: TextStyle(color: ConstColors.primary),
        unselectedIconTheme: IconThemeData(
            color: ConstColors.displaySmall, applyTextScaling: true),
        selectedIconTheme:
            IconThemeData(color: ConstColors.primary, applyTextScaling: true)),
    tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle: TextStyle(color: ConstColors.displaySmall),
        labelStyle: TextStyle(color: ConstColors.displayMedium)),
  );
}

class ConstColors {
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color green = Colors.green;

  static const Color displayLarge = Colors.black;
  static const Color displayMedium = Colors.black;
  static const Color displaySmall = Color(0xffB3B8C4);

  static const Color fieldFilled = Color(0xffEEEEEE);
  static const Color pinfieldFilled = Color(0xffFCFCFC);

  static const Color primary = Color(0xff514EB7);
}
