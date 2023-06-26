import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/data/response/status.dart';
import 'package:sporter_turf_booking/home/components/error_data_widget.dart';
import 'package:sporter_turf_booking/home/components/my_bookings_component/booked_venue_card.dart';
import 'package:sporter_turf_booking/home/view_model/my_bookings_view_model.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';

class MyBookingsView extends StatelessWidget {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: Consumer<MyBookingsViewModel>(
        builder: (context, value, child) {
          switch (value.myBookingsModel.status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.error:
              return const NoInternetWidget();
            case Status.completed:
              final bookingList = value.myBookingsModel.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      AppSizes.kHeight10,
                      ListView.separated(
                        itemCount: bookingList.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            AppSizes.kHeight20,
                        itemBuilder: (context, int index) {
                          final reversedIndex = bookingList.length - index - 1;

                          final venuData = bookingList[reversedIndex].turfId;
                          final bookingData = bookingList[reversedIndex];
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
                            bookingData: bookingData,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
