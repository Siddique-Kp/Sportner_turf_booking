import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/user_registration/view/change_pass_view.dart';

import '../home/view/bottom_navbar.dart';
import '../home/view/home_view.dart';
import '../user_registration/view/forget_password_view.dart';
import '../user_registration/view/login_view.dart';
import '../user_registration/view/otp_page_view.dart';
import '../user_registration/view/sign_up_view.dart';
import '../user_registration/view/splash_screen_view.dart';

class NavigatorClass {
  static const homeScreen = "/homeScreen";
  static const loginScreen = "/userLogin";
  static const forgetPassScreen = "/forgetPass";
  static const changeforgetPass = "/changeforgetPass";
  static const signUpScreen = "/userSignUp";
  static const otpScreen = "/otpRegister";
  static const splashScreen = "/splashScreen";
  static const mainScreen = "/bottomBarView";

  static Map<String, Widget Function(BuildContext)> routes() {
    Map<String, Widget Function(BuildContext)> routes = {
      "/splashScreen": (context) => const SplashScreen(),
      "/userSignUp": (context) => const UserSignUpScreen(),
      "/userLogin": (context) => const UserLoginScreen(),
      "/otpRegister": (context) => const OtpVerificationPage(),
      "/homeScreen": (context) => const HomeScreenView(),
      "/forgetPass": (context) => ForgetPasswordScreen(),
      "/changeforgetPass": (context) =>  ChangePassView(),
      "/bottomBarView": (context) =>  BottomBarView(),
    };

    return routes;
  }
}
