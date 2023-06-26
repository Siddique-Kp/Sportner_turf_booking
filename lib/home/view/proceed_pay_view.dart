import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/proceed_payment_view_model.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';
import '../../utils/global_colors.dart';
import '../components/payment_page_component/booking_details_container.dart';
import '../components/payment_page_component/booking_policy.dart';
import '../components/payment_page_component/payment_details_container.dart';
import '../view_model/user_profile_view_model.dart';
import '../view_model/venue_details_view_model.dart';

class ProceedPayView extends StatelessWidget {
  const ProceedPayView({super.key});

  @override
  Widget build(BuildContext context) {
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    final bookingViewModel = context.watch<BookingSlotViewModel>();
    final paymentViewModel = context.read<ProceedPaymentViewModel>();
    final userDataViewModel = context.watch<UserProfileViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      paymentViewModel.getVenueData(venueData);
      paymentViewModel.setBookingData(bookingViewModel);
    });
    log("Rebuilded");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Payment",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSizes.kHeight20,
              const BookingDetailsContainer(),
              AppSizes.kHeight10,
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.lightGrey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 30,
                            color:
                                userDataViewModel.userProfileModel?.data?.wallet == 0
                                    ? AppColors.lightGrey
                                    : const Color.fromARGB(151, 0, 181, 97),
                          ),
                          AppSizes.kWidth10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Include Wallet money!",
                                style:
                                    userDataViewModel.userProfileModel?.data?.wallet ==
                                            0
                                        ? AppTextStyles.textH4grey
                                        : AppTextStyles.textH4,
                              ),
                              Text(
                                "Wallet balance : ₹ ${userDataViewModel.userProfileModel?.data?.wallet ?? 0}.0",
                                style: AppTextStyles.textH5grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Consumer<ProceedPaymentViewModel>(
                      builder: (context, proceedPayViewModel, child) {
                        return Checkbox(
                          value: proceedPayViewModel.isWallet,
                          onChanged:
                              userDataViewModel.userProfileModel?.data?.wallet == 0
                                  ? null
                                  : (value) {
                                      proceedPayViewModel
                                          .setPaymentMethod(value);
                                    },
                        );
                      },
                    ),
                  ],
                ),
              ),
              AppSizes.kHeight10,
              PaymentDetailsContainer(venueData: venueData),
              AppSizes.kHeight10,
              const BookingPolicyWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 45,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            paymentViewModel.getOrderModel(venueId: venueData.sId!);
          },
          child: const Text("Proceed to pay"),
        ),
      ),
    );
  }
}
