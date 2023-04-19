import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/venue_list_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import '../components/appbar_location.dart';
import '../components/home_components/home_header_section.dart';
import '../components/home_components/home_nearest_turf_widget.dart';
import '../components/home_components/home_offered_turf_widget.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  void initState() {
    context.read<VenueListViewModel>().getVenueListDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final venueDataList = context.read<VenueListViewModel>().venuDataList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: const AppBarLocation(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.20,
              child: const HomeHeaderSection(),
            ),
            venueDataList.isEmpty?const CircularProgressIndicator():
            const HomeNearestTurfWidget(),
            AppSizes.kHeight20,
             venueDataList.isEmpty?const CircularProgressIndicator():
            const TurfWithOfferWidget()
          ],
        ),
      ),
    );
  }
}
