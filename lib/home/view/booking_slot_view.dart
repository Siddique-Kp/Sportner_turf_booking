import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/turf_details_components/available_sport_widget.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';
import '../components/booking_slot_components/booking_slot_bottom_bar.dart';
import '../components/booking_slot_components/date_container.dart';
import '../components/booking_slot_components/facility_widget.dart';
import '../components/booking_slot_components/time_manage_widget.dart';
import '../view_model/venue_details_view_model.dart';

class BookingSlotView extends StatelessWidget {
  const BookingSlotView({super.key});

  @override
  Widget build(BuildContext context) {
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<BookingSlotViewModel>().setSelectedSport(-1, "","");
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Booking",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvailableSportsWidget(venueData: venueData),
              AppSizes.kHeight20,
              const Divider(thickness: 2, color: AppColors.black),
              AppSizes.kHeight20,
              const FacilityWidget(),
              AppSizes.kHeight20,
              Text("Select Date", style: AppTextStyles.textH2),
              AppSizes.kHeight20,
              const DateContainerWidget(),
              AppSizes.kHeight30,
              const TimeManageWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BookingSlotBottomBar(),
    );
  }
}


