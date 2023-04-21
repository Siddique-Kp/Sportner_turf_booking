import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';
import '../components/turf_details_components/available_sport_widget.dart';
import '../components/turf_details_components/contact_info_widget.dart';
import '../components/turf_details_components/description_text.dart';
import '../components/turf_details_components/get_location_widget.dart';
import '../components/turf_details_components/turf_details_head.dart';

class VenueDetailsView extends StatelessWidget {
  const VenueDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    final size = MediaQuery.of(context).size;
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    final venueViewModel = context.watch<VenueDetailsViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: MyColors.white,
            expandedHeight: size.height * 0.30,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                    color: MyColors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: venueViewModel.isLoading
                  ? const CircularProgressIndicator()
                  : Image.network(
                      venueData.image!,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(75, 158, 158, 158)),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TurfDetailsHeader(),
                  AppSizes.kHeight20,
                  const AvailableSportsWidget(),
                  AppSizes.kHeight10,
                  const GetLocationWidget(),
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




