import 'package:flutter/material.dart';

class NavigationServices {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future pushAndRemoveUntilTo(String routeName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  Future pushNamedTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void popBack() {
    return navigatorKey.currentState!.pop();
  }
}
