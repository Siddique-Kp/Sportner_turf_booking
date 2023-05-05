import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/routes/navigations.dart';
import '../../view_model/venue_details_view_model.dart';

class BookingSlotBottomBar extends StatelessWidget {
  const BookingSlotBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    final bookingViewModel = context.watch<BookingSlotViewModel>();
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color.fromARGB(67, 158, 158, 158),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           bookingViewModel.checkBookingSelection()? Text(
              "Total : ${venueData.actualPrice}.00",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.appColor,
                fontSize: 19,
              ),
            ):AppSizes.kHeight10,
            SizedBox(
              height: 44,
              width: 100,
              child: ElevatedButton(
                onPressed: bookingViewModel.checkBookingSelection()
                    ? () {
                        Navigator.pushNamed(
                            context, NavigatorClass.paymentScreen);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  disabledBackgroundColor: AppColors.lightGrey,
                ),
                child: const Text("NEXT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
