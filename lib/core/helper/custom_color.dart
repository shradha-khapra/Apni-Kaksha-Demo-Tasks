import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomColors {
  //LINEAR GRADIENT
  LinearGradient greencolorlineargradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
    colors: <Color>[
      /// Colors.green.shade800,
      Color.fromARGB(
        255,
        72,
        255,
        0,
      ),
      Color.fromARGB(255, 101, 207, 35),
    ],
  );

  //
  Color mybackgroundgreencolor = Color.fromARGB(
    255,
    72,
    255,
    0,
  );

  //GREEN SHADE
  Color mygreencolorshade600 = Colors.green.shade600;

  //GREEN BOX SHADOW
  BoxShadow mygreenboxshadow = BoxShadow(
    color: Colors.green.shade800,
    spreadRadius: 1,
    blurRadius: 15,
    offset: Offset(0, 10),
  );

  //
  Color myyellow800 = Colors.yellow.shade800;

  //GREN SHADE 300
  Color greencolorshade300 = Colors.green.shade300;

  //
  Gradient customlineargradient(Color color1, Color color2, Color color3,
      Color color4, Color color5, Color color6, Color color7) {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        color1,
        color2,
        color3,
        color4,
        color5,
        color6,
        color7,
      ],
    );
  }
}
