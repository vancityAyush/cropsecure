import '../utill/dimensions.dart';
import '../utill/color_resources.dart';
import 'package:flutter/material.dart';

const Color primary = Color(0xFFFFFFFF);

ThemeData dark = ThemeData(
  fontFamily: 'Proxima Nova',
  primaryColor: const Color(0xFFFFFFFF),
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  primarySwatch: ColorResources.kToDark,
  accentColor: const Color(0xFF262626),
  hintColor: const Color(0xFFFFFFFF),
  focusColor: const Color(0xffFFFFFF),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.green,     //  <-- dark color
    textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
    primary: Colors.blue, textStyle: const TextStyle(color: Colors.black),
  )),
  textTheme: const TextTheme(
    button: TextStyle(color: Color(0xFF262626)),
    headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline3: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline6: TextStyle(fontWeight: FontWeight.w800, fontSize: Dimensions.FONT_SIZE_LARGE),
    caption: TextStyle(fontWeight: FontWeight.w900, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 12.0),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);