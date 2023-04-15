import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/components/appbar_widget.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(
          isNormalAppbar: true,
          title: "Payment",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            AppSizes.kHeight20,
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: MyColors.lightGrey),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("LiverPool Soccer", style: AppTextStyles.textH1),
                    _turfDetails(
                        icon: Icons.location_on,
                        text: "Near Hilite mall , calicut"),
                    _turfDetails(
                        icon: Icons.calendar_today_outlined,
                        text: "Sun, 30th March"),
                    _turfDetails(
                        icon: Icons.access_time_rounded,
                        text: "05:00 PM - 06:00 PM"),
                    _turfDetails(
                        icon: Icons.payments_outlined, text: "INR .1600"),
                  ],
                ),
              ),
            ),
            AppSizes.kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Court Price :", style: AppTextStyles.textH4),
                Text("INR 1600", style: AppTextStyles.textH4)
              ],
            ),
            AppSizes.kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Offer Discount :", style: AppTextStyles.textH4),
                Text("INR 300", style: AppTextStyles.textH4)
              ],
            ),
            AppSizes.kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payable Amount :", style: AppTextStyles.textH4),
                Text("INR 1300", style: AppTextStyles.textH4)
              ],
            ),
            AppSizes.kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount :", style: AppTextStyles.textH2),
                Text("INR 1300", style: AppTextStyles.textH2)
              ],
            ),
            AppSizes.kHeight10,
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                collapsedIconColor: MyColors.black,
                title: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Policies",
                        style: AppTextStyles.textH3,
                      ),
                      const Divider(thickness: 1.5,color: Colors.black,)
                    ],
                  ),
                ),
                tilePadding: const EdgeInsets.all(0),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Resceduling policy",
                        style: AppTextStyles.textH3,
                      ),
                      AppSizes.kHeight5,
                      const Text(
                          '''Rescheduling is allowed 2 Hours prior to slot time. Rescheduling of a booking can be done only 2 times. Once rescheduled, booking cannot be cancelled.'''),
                    ],
                  ),
                  AppSizes.kHeight10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cancel policy",
                        style: AppTextStyles.textH3,
                      ),
                       AppSizes.kHeight5,
                      const Text(
                          '''0-2 hrs prior to slot: Cancellations not allowed.>2 hrs prior to slot: 15.0% of Gross Amount will be deducted as cancellation fee.'''),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 45,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text("Proceed to pay"),
        ),
      ),
    );
  }

  Row _turfDetails({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: const Color.fromARGB(150, 0, 0, 0),
        ),
        AppSizes.kWidth5,
        Text(
          text,
          style: AppTextStyles.textH5light,
        ),
      ],
    );
  }
}
