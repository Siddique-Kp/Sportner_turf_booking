import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/error_data_widget.dart';
import 'package:sporter_turf_booking/home/components/venue_list_card_widget.dart';
import 'package:sporter_turf_booking/home/view_model/venue_by_sport_view_model.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import '../components/sports_icon.dart';

class VenueBySportView extends StatelessWidget {
  final String title;
  const VenueBySportView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final venueBySportViewModel = context.watch<VenueBySportViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: venueBySportViewModel.venuDataList.isEmpty
          ? const NoDataWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: venueBySportViewModel.venuDataList.length,
                      separatorBuilder: (context, int index) =>
                          AppSizes.kHeight10,
                      itemBuilder: (context, int index) {
                        final venueData =
                            venueBySportViewModel.venuDataList[index];
                        return SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: VenueListCardWidget(
                            venueName: venueData.venueName!,
                            imageUrl: venueData.image!,
                            sportFacilityLendth:
                                venueData.sportFacility!.length,
                            venuePrice: venueData.actualPrice.toString(),
                            district: venueData.district!,
                            venueID: venueData.sId!,
                            latitude: venueData.lat!,
                            longitude: venueData.lng!,
                            sportIconWidget: ListView.builder(
                              itemCount: venueData.sportFacility!.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Icon(
                                  Sports.spots(
                                    sport:
                                        venueData.sportFacility![index].sport!,
                                  ),
                                  size: 15,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    AppSizes.kHeight30,
                  ],
                ),
              ),
            ),
    );
  }
}
