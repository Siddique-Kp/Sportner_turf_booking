import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import '../components/turf_details_components/available_sport_widget.dart';
import '../components/turf_details_components/contact_info_widget.dart';
import '../components/turf_details_components/description_text.dart';
import '../components/turf_details_components/get_location_widget.dart';
import '../components/turf_details_components/sliver_appbar_widget.dart';
import '../components/turf_details_components/turf_details_head.dart';

class VenueDetailsView extends StatelessWidget {
  const VenueDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    // final size = MediaQuery.of(context).size;
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    final venueViewModel = context.watch<VenueDetailsViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: [
          SliverAppBarWidget(
            venueViewModel: venueViewModel,
            venueData: venueData,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TurfDetailsHeader(),
                  AppSizes.kHeight20,
                  AvailableSportsWidget(venueData: venueData),
                  AppSizes.kHeight10,
                  GetLocationWidget(venueData: venueData),
                  AppSizes.kHeight20,
                  DescriptionText(venueData: venueData),
                  AppSizes.kHeight30,
                  const TurfDetailsContactInfo(),
                  AppSizes.kHeight40,
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 45,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, NavigatorClass.bookingSlotScreen);
          },
          child: const Text("BOOK NOW"),
        ),
      ),
    );
  }
}


