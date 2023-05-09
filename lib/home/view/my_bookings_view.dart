import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/my_bookings_component/booked_venue_card.dart';
import 'package:sporter_turf_booking/home/view_model/my_bookings_view_model.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';

class MyBookingsView extends StatelessWidget {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final myBookings = context.watch<MyBookingsViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              AppSizes.kHeight10,
              ListView.separated(
                itemCount:myBookings.myBookingsList.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                separatorBuilder: (context, index) => AppSizes.kHeight20,
                itemBuilder: (context, int index) {
                  final venuData = myBookings.myBookingsList[index].turfId;
                  final bookingData = myBookings.myBookingsList[index];
                  return BookedVenueCard(
                    venueName: venuData!.venueName!,
                    imageUrl: venuData.image!,
                    sportName: bookingData.sport!,
                    facility: bookingData.facility!,
                    bookedDate: bookingData.slotDate!,
                    bookedTime: bookingData.slotTime!,
                    bookedPrice: bookingData.price.toString(),
                    district: venuData.district!,
                    venueID: venuData.id!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
