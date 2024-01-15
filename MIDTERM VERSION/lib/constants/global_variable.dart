import 'package:flutter/material.dart';

String uri = 'http://localhost:3000';

class GlobalVar {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 52, 201, 29),
      Color.fromARGB(255, 85, 237, 98),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(60, 122, 255, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}