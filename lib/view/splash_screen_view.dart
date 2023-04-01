import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sporter_turf_booking/view/login_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: double.infinity,
        splash: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              "assets/LOGO.svg",
            ),
          ),
        ),
        nextScreen:  const UserLoginScreen(),
      ),
    );
  }
}
