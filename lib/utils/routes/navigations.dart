import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/view/proceed_pay_view.dart';
import 'package:sporter_turf_booking/home/view/booking_slot_view.dart';
import 'package:sporter_turf_booking/home/view/payment_success_view.dart';
import 'package:sporter_turf_booking/home/view/turf_details_view.dart';
import 'package:sporter_turf_booking/user_registration/view/change_pass_view.dart';
import '../../home/view/bottom_navbar.dart';
import '../../home/view/home_view.dart';
import '../../home/view/my_bookings_view.dart';
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
  static const myBookingsView = "/MyBookingView";
  static const paymentSuccessView = "/PaymentSuccessView";

  static Map<String, Widget Function(BuildContext)> routes() {
    Map<String, Widget Function(BuildContext)> routes = {
      "/splashScreen": (context) => const SplashScreen(),
      "/userSignUp": (context) => const UserSignUpScreen(),
      "/userLogin": (context) => const UserLoginScreen(),
      "/otpRegister": (context) => const OtpVerificationPage(),
      "/homeScreen": (context) => const HomeScreenView(),
      "/forgetPass": (context) => ForgetPasswordScreen(),
      "/changeforgetPass": (context) => ChangePassView(),
      "/bottomBarView": (context) => BottomBarView(),
      "/bookingSlotScreen": (context) => const BookingSlotView(),
      "/paymentScreen": (context) => const ProceedPayView(),
      "/VenueDetailsScreen": (context) => const VenueDetailsView(),
      "/MyBookingView": (context) => const MyBookingsView(),
      "/PaymentSuccessView": (context) => const PaymentSuccessView(),
    };

    return routes;
  }

  static Route animatedRoute({
    required dynamic route,
    double dx = 0.0,
    double dy = 1.0,
    bool fade = true,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = Offset(dx, dy);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return fade
            ? FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: child,
                ),
              )
            : SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
      },
    );
  }
}
