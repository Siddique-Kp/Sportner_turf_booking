import 'package:flutter/material.dart';

// colors
class MyColors {
  static const scaffoldColor = Colors.white;
  static const kButtonColor = Color(0xFF00B562);
  static const appMainGreenColor = Color.fromARGB(255, 0, 181, 98);
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const klightBlackColor = Colors.black54;
  static const kGreyColor = Colors.grey;
}

class PrimaryColor {
  static MaterialColor appColor = const MaterialColor(
    0xFF00B562,
    <int, Color>{
      50: Color(0xFFE6F7EA),
      100: Color(0xFFB3E6C9),
      200: Color(0xFF80D6A8),
      300: Color(0xFF4DC687),
      400: Color(0xFF26B974),
      500: Color(0xFF00B562),
      600: Color(0xFF00B05A),
      700: Color(0xFF00A751),
      800: Color(0xFF009F49),
      900: Color(0xFF008F3B),
    },
  );
}

class SportsColor{
  static const cFootball = Color(0xFFD2F1D2);
  static const cCricket =  Color.fromARGB(255, 251, 204, 195);
  static const cBasketBall = Color.fromARGB(255, 221, 181, 131);
  static const cBadminton = Color.fromARGB(255, 96, 221, 96);
  static const cVolleyBall = Color.fromARGB(255, 107, 188, 238);
}
