import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/appbar_location.dart';
import 'package:sporter_turf_booking/home/view_model/venue_list_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../components/venue_list_card_widget.dart';

class VenueScreenView extends StatelessWidget {
  const VenueScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final venueDataList = context.watch<VenueListViewModel>().venuDataList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const AppBarLocation(),
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: const Icon(Icons.search, color: AppColors.black),
          ),
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: const Icon(Icons.tune, color: AppColors.black),
          ),
        ],
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10), child: SizedBox()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          itemCount: venueDataList.length,
          separatorBuilder: (context, index) => AppSizes.kHeight20,
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              height: 80,
              child: VenueListCardWidget(
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
