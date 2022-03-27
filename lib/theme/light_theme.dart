import '../utill/dimensions.dart';
import '../utill/color_resources.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Proxima Nova',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF6cbd47),
  primarySwatch: ColorResources.kToLight,
  accentColor: Colors.green,
  focusColor: const Color(0xFFFFFFFF),
    // hintColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0)
        )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xffffffff),), //text (and icon)
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.accent,
    buttonColor: Colors.green
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
    primary: const Color(0xFF6cbd47), textStyle: const TextStyle(color: Colors.white),
  )),
  textTheme: const TextTheme(
    button: TextStyle(color: Color(0xFF6cbd47)),
    headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline3: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline6: TextStyle(fontWeight: FontWeight.w800, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    caption: TextStyle(fontWeight: FontWeight.w900, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 12.0),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);