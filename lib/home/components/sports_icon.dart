import 'package:flutter/material.dart';

class Sports {
  static Widget spots({required String sport, double size = 15}) {
    switch (sport) {
      case "football":
        return Icon(Icons.sports_soccer, size: size);
      case "Cricket":
        return Icon(Icons.sports_cricket, size: size);
      case "Football":
        return Icon(Icons.sports_soccer, size: size);
      case "Volley ball":
        return Icon(Icons.sports_volleyball, size: size);
      case "Basket ball":
        return Icon(Icons.sports_basketball, size: size);
      case "Badminton":
        return Icon(Icons.sports_soccer, size: size);
      default:
        return const Text("");
    }
  }
}
