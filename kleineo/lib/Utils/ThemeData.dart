import 'package:flutter/material.dart';

class KleineoColors {
  static final white = Colors.white;
  static final black = Colors.black;
  static final red = Color(0xffFF4F5A);
  static final lightgrey = Colors.grey[400];
  static final grey = Color(0xff1E1E1E);
}

final LightTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: KleineoColors.white
    ),
    backgroundColor: KleineoColors.white,
     selectedItemColor: KleineoColors.red,
     unselectedItemColor: KleineoColors.red,
  ),
    appBarTheme: AppBarTheme(
        backgroundColor: KleineoColors.white,
        iconTheme: IconThemeData(color: KleineoColors.black)),
    iconTheme: IconThemeData(color: KleineoColors.black),
    scaffoldBackgroundColor: KleineoColors.white,
    accentColor: KleineoColors.white,
    primaryColor: KleineoColors.red,
    cardTheme: CardTheme(
      color: KleineoColors.white
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
          color: KleineoColors.red, fontFamily: 'Oswald', fontSize: 24),
      headline5: TextStyle(color: KleineoColors.white, fontSize: 15),
      headline4: TextStyle(
          color: KleineoColors.black, fontFamily: 'Oswald', fontSize: 15),
      headline3: TextStyle(
          color: KleineoColors.black, fontFamily: 'Oswald', fontSize: 18),
      headline2: TextStyle(
          color: KleineoColors.red, fontFamily: 'Oswald', fontSize: 18),
          
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: KleineoColors.black)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: KleineoColors.black)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: KleineoColors.black)),
    ));

final  DarkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: KleineoColors.black
    ),
    backgroundColor: KleineoColors.black,
     selectedItemColor: KleineoColors.white,
     unselectedItemColor: KleineoColors.white
  ),
  cardTheme: CardTheme(
      color: KleineoColors.lightgrey
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: KleineoColors.grey,
        iconTheme: IconThemeData(color: KleineoColors.white)),
    iconTheme: IconThemeData(color: KleineoColors.white),
    scaffoldBackgroundColor: KleineoColors.grey,
    accentColor: KleineoColors.white,
    primaryColor: KleineoColors.black,
    textTheme: TextTheme(
      headline6: TextStyle(
          color: KleineoColors.white, fontFamily: 'Oswald', fontSize: 24),
      headline5: TextStyle(color: KleineoColors.white, fontSize: 15),
      headline4: TextStyle(
          color: KleineoColors.white, fontFamily: 'Oswald', fontSize: 15),
      headline3: TextStyle(
          color: KleineoColors.white, fontFamily: 'Oswald', fontSize: 18),
      headline2: TextStyle(
          color: KleineoColors.black, fontFamily: 'Oswald', fontSize: 18),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: KleineoColors.white)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: KleineoColors.white)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: KleineoColors.white)),
    ));
