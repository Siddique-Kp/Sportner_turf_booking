import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';
import 'package:sporter_turf_booking/view/login_view.dart';
import 'package:sporter_turf_booking/view/otp_page_view.dart';
import 'package:sporter_turf_booking/view/sign_up_view.dart';
import 'package:sporter_turf_booking/view/splash_screen_view.dart';
import 'package:sporter_turf_booking/view_model/sign_up_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'sportner turf booking app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldColor,
            primaryColor: appMainGreenColor,
            elevatedButtonTheme: const ElevatedButtonThemeData(
                style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(kButtonColor),
            )),
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  color: scaffoldColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0)),
        routes: {
          "/splashScreen": (context) => const SplashScreen(),
          "/userSignUp": (context) => UserSignUpScreen(),
          "/userLogin": (context) => const UserLoginScreen(),
          "/otpRegister": (context) =>  const OtpVerificationPage()
        },
        initialRoute: "/splashScreen",
      ),
    );
  }
}
