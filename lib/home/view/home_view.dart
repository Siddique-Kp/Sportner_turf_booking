import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/data/response/status.dart';
import 'package:sporter_turf_booking/home/components/error_data_widget.dart';
import 'package:sporter_turf_booking/home/view_model/venue_list_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import '../components/appbar_location.dart';
import '../components/home_components/home_header_section.dart';
import '../components/home_components/home_nearest_turf_widget.dart';
import '../components/home_components/home_offered_turf_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: const AppBarLocation(),
      ),
      body: Consumer<VenueListViewModel>(builder: (context, value, child) {
        switch (value.venuDataList.status) {
          case Status.error:
            return const NoInternetWidget();
          case Status.loading:
            return const Center(child:  CircularProgressIndicator());
            case Status.completed:
             return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.20,
                child: const HomeHeaderSection(),
              ),
              const HomeNearestTurfWidget(),
              AppSizes.kHeight20,
              const TurfWithOfferWidget()
            ],
          ),
        );
          default:
            return const SizedBox();
        }
       
      }),
    );
  }
}
