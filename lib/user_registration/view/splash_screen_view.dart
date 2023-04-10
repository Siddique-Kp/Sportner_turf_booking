import 'dart:developer';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/home/components/bottom_navbar.dart';
import 'package:sporter_turf_booking/user_registration/view/login_view.dart';
import 'package:sporter_turf_booking/utils/keys.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          log(snapshot.data.toString());
          return AnimatedSplashScreen(
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
            nextScreen: snapshot.data!,
          );
        },
      ),
    );
  }
}

Future<Widget> loginStatus() async {
  final status = await SharedPreferences.getInstance();
  final userLoggedIn = status.getBool(GlobalKeys.userLoggedIN) ?? false;
  final userSignedIn = status.getBool(GlobalKeys.userSignedUp) ?? false;
  final userSignedWithGoogle =
      status.getBool(GlobalKeys.userLoggedWithGoogle) ?? false;
  log(userLoggedIn.toString());
  log(userSignedIn.toString());
  log(userSignedWithGoogle.toString());
  if (userLoggedIn == false &&
      userSignedIn == false &&
      userSignedWithGoogle == false) {
    return const UserLoginScreen();
  } else {
    return  BottomBarView();
  }
}
