import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static final defaultTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: const Color(0xff81AA66),
    backgroundColor: Colors.white,
    accentColor: const Color(0xff999999),
    primaryColorLight: const Color(0xffF77C85),
    fontFamily: "Inter",
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );

  static setStatusBarAndNavigationBarColors() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: defaultTheme.backgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
