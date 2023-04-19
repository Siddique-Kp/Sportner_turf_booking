import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/view/payment_page_view.dart';
import 'package:sporter_turf_booking/home/view/booking_slot_view.dart';
import 'package:sporter_turf_booking/home/view/turf_details_view.dart';
import 'package:sporter_turf_booking/user_registration/view/change_pass_view.dart';

import '../../home/view/bottom_navbar.dart';
import '../../home/view/home_view.dart';
import '../../user_registration/view/forget_password_view.dart';
import '../../user_registration/view/login_view.dart';
import '../../user_registration/view/otp_page_view.dart';
import '../../user_registration/view/sign_up_view.dart';
import '../../user_registration/view/splash_screen_view.dart';

class NavigatorClass {
  static const homeScreen = "/homeScreen";
  static const loginScreen = "/userLogin";
  static const forgetPassScreen = "/forgetPass";
  static const changeforgetPass = "/changeforgetPass";
  static const signUpScreen = "/userSignUp";
  static const otpScreen = "/otpRegister";
  static const splashScreen = "/splashScreen";
  static const mainScreen = "/bottomBarView";
  static const bookingSlotScreen = "/bookingSlotScreen";
  static const paymentScreen = "/paymentScreen";
  static const venueDetailsScreen = "/VenueDetailsScreen";

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
      "/bookingSlotScreen": (context) =>  const BookingSlotView(),
      "/paymentScreen": (context) =>  const PaymentPageView(),
      "/VenueDetailsScreen": (context) =>  const VenueDetailsView(),
    };

    return routes;
  }
}
