import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  final ThemeData themeData = ThemeData(
      primaryColor: ConstColors.primary,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: ConstColors.displayLarge,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: ConstColors.displaySmall,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(
          color: ConstColors.displayMedium,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: ConstColors.displayMedium,
          fontSize: 12.sp,
          // fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(
          color: ConstColors.displaySmall,
          fontSize: 10.sp,
          // fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          color: ConstColors.displaySmall,
          fontSize: 12.sp,
        ),
        bodyMedium: TextStyle(
          color: ConstColors.displaySmall,
          fontSize: 14.sp,
        ),
        bodyLarge: TextStyle(
          color: ConstColors.displayLarge,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 16.sp, color: ConstColors.primary)),
              foregroundColor:
                  WidgetStateProperty.all<Color>(ConstColors.primary))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 50.w)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)))),
          textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(color: ConstColors.white, fontSize: 16.sp)),
          foregroundColor: WidgetStateProperty.all<Color>(ConstColors.white),
          backgroundColor: WidgetStateProperty.all<Color>(ConstColors.primary),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          side: const BorderSide(
            color: ConstColors.displaySmall,
          ),
          textStyle: TextStyle(
              color: ConstColors.displayLarge,
              fontSize: 14.sp,
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
      appBarTheme: AppBarTheme(
          backgroundColor: ConstColors.white,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: ConstColors.displayMedium,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          actionsIconTheme: IconThemeData(size: 25.w)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: ConstColors.white,
          unselectedLabelStyle: TextStyle(color: ConstColors.displaySmall),
          selectedLabelStyle: TextStyle(color: ConstColors.primary),
          unselectedIconTheme: IconThemeData(
              color: ConstColors.displaySmall, applyTextScaling: true),
          selectedIconTheme: IconThemeData(
              color: ConstColors.primary, applyTextScaling: true)),
      tabBarTheme: const TabBarTheme(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelStyle: TextStyle(color: ConstColors.displaySmall),
          labelStyle: TextStyle(color: ConstColors.displayMedium)),
      chipTheme: const ChipThemeData(
          backgroundColor: ConstColors.white,
          deleteIconColor: ConstColors.displaySmall),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.all(0),
        titleTextStyle: TextStyle(
            color: ConstColors.displayLarge,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),
        subtitleTextStyle: TextStyle(
          color: ConstColors.displaySmall,
          fontSize: 12.sp,
        ),
      ));
}

class ConstColors {
  static const Color white = Colors.white;
  static const Color cardBackRed = Color(0xFFFFDBDB);
  static const Color cardBackorange = Color(0xFFFFE9DC);
  static const Color cardBackGreen = Color(0xFFE0FFF0);
  static const Color green = Colors.green;

  static const Color displayLarge = Colors.black;
  static const Color displayMedium = Colors.black;
  static const Color displaySmall = Color(0xffB3B8C4);

  static const Color fieldFilled = Color(0xffEEEEEE);
  static const Color pinfieldFilled = Color(0xffFCFCFC);

  static const Color primary = Color(0xff514EB7);
}
