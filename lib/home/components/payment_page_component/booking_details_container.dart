import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/sports_icon.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../../utils/textstyles.dart';
import '../../view_model/venue_details_view_model.dart';

class BookingDetailsContainer extends StatelessWidget {
  const BookingDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    final bookingData = context.watch<BookingSlotViewModel>();

    log(bookingData.selectedTime.toString());

    final bookedDate =
        DateFormat('E, d\'th\' MMMM').format(bookingData.selectedDate!);

    final bookedTime1 = bookingData
        .convertTo12HourFormat(bookingData.selectedTime.split("-").first);
    final bookedTime2 = bookingData
        .convertTo12HourFormat(bookingData.selectedTime.split("-").last);

    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: AppColors.lightGrey),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(venueData.venueName!, style: AppTextStyles.textH1),
            _turfDetails(
                icon: Sports.spots(sport: bookingData.selectedSportName),
                text: bookingData.selectedSportName),
            _turfDetails(icon: Icons.calendar_today_outlined, text: bookedDate),
            _turfDetails(
                icon: Icons.access_time_rounded,
                text: "$bookedTime1 - $bookedTime2"),
            _turfDetails(
                icon: Icons.payments_outlined,
                text: "₹${venueData.actualPrice}"),
          ],
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
