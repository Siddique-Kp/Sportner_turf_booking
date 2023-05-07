import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/view/payment_success_view.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';

class RoutGenerator {
  static Route generateRout(RouteSettings routes) {
    switch (routes.name) {
      case NavigatorClass.paymentSuccessView:
        return MaterialPageRoute(
            builder: (context) => const PaymentSuccessView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "404 NOT FOUND",
                style: AppTextStyles.textH1,
              ),
            ),
          ),
        );
    }
  }
}
