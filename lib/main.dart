import 'package:apnikaksha/screens/card_screen.dart';
import 'package:apnikaksha/screens/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => ProductScreen(),
      // "/card": (context) => CardScreen()
    },
  ));
}
