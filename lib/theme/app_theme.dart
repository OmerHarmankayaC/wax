import 'package:flutter/material.dart';

const Color kBackground = Color(0xFFF5F0DC);
const Color kBlack = Color(0xFF0D0D0D);
const Color kRed = Color(0xFFD72B2B);
const Color kWhite = Color(0xFFFFFFFF);

final ThemeData appTheme = ThemeData(
  fontFamily: 'Courier',
  scaffoldBackgroundColor: kBackground,
  colorScheme: const ColorScheme.light(
    primary: kBlack,
    secondary: kRed,
    surface: kBackground,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kBackground,
    elevation: 0,
    foregroundColor: kBlack,
    titleTextStyle: TextStyle(
      fontFamily: 'Courier',
      color: kBlack,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
    iconTheme: IconThemeData(color: kBlack),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kBlack,
    selectedItemColor: kRed,
    unselectedItemColor: kBackground,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Courier',
      color: kBlack,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(fontFamily: 'Courier', color: kBlack),
    bodySmall: TextStyle(fontFamily: 'Courier', color: kBlack),
  ),
);
