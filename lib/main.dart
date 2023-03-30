import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';
import 'package:sporter_turf_booking/view/login_view.dart';
import 'package:sporter_turf_booking/view/sign_up_view.dart';
import 'package:sporter_turf_booking/view/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sportner turf booking app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldColor,
        primaryColor: appMainGreenColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(buttonColor))
        ),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: scaffoldColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0
        )

      ),
      routes: {
        "/splashScreen" :(context) => const SplashScreen(),
        "/userSignUp" :(context) =>  UserSignUpScreen(),
        "/userLogin" :(context) => const UserLoginScreen()
      },
      initialRoute: "/splashScreen",
    );
  }
}




