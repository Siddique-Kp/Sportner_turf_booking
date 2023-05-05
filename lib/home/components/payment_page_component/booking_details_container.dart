import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../../utils/textstyles.dart';
import '../../view_model/venue_details_view_model.dart';

class BookingDetailsContainer extends StatelessWidget {
  const BookingDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final venueData = context.watch<VenueDetailsViewModel>().venueData;

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
            _turfDetails(icon: Icons.location_on, text: venueData.place!),
            _turfDetails(
                icon: Icons.calendar_today_outlined, text: "Sun, 30th March"),
            _turfDetails(
                icon: Icons.access_time_rounded, text: "05:00 PM - 06:00 PM"),
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
