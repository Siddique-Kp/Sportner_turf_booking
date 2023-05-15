import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/my_bookings_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/proceed_payment_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/user_profile_view_model.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import '../../utils/global_colors.dart';
import '../view_model/booking_slot_view_model.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentViewModel = context.read<ProceedPaymentViewModel>();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          NavigatorClass.mainScreen,
          (route) => false,
        );
        context.read<MyBookingsViewModel>().getMyBookingsDatas();
        context.read<BookingSlotViewModel>().clearBookingSelection();
        context.read<UserProfileViewModel>().getUserProfileData();
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 80,
                color: AppColors.appColor,
              ),
              const Text(
                "Payment\n Succsessfull!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: AppColors.appColor,
                ),
              ),
              Text(
                "Order id : ${paymentViewModel.orderId}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color: AppColors.appColor,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        NavigatorClass.mainScreen,
                        (route) => false,
                      );
                      context.read<MyBookingsViewModel>().getMyBookingsDatas();
                      context
                          .read<BookingSlotViewModel>()
                          .clearBookingSelection();
                      context.read<UserProfileViewModel>().getUserProfileData();
                    },
                    style: ElevatedButton.styleFrom(elevation: 0),
                    child: const Text("Go to Home"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
