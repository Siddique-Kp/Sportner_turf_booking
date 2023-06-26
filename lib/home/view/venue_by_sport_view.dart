import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/data/response/status.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Consumer<VenueBySportViewModel>(
        builder: (context, value, child) {
          switch (value.venueDataModel.status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.error:
              return const NoInternetWidget();
            case Status.completed:
              final venueDataList = value.venueDataModel.data!;
              return venueDataList.isEmpty
                  ? const NoDataWidget()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: venueDataList.length,
                              separatorBuilder: (context, int index) =>
                                  AppSizes.kHeight10,
                              itemBuilder: (context, int index) {
                                final venueData = venueDataList[index];
                                return SizedBox(
                                  width: double.infinity,
                                  height: 80,
                                  child: VenueListCardWidget(
                                    venueName: venueData.venueName!,
                                    imageUrl: venueData.image!,
                                    sportFacilityLendth:
                                        venueData.sportFacility!.length,
                                    venuePrice:
                                        venueData.actualPrice.toString(),
                                    district: venueData.district!,
                                    venueID: venueData.sId!,
                                    latitude: venueData.lat!,
                                    longitude: venueData.lng!,
                                    sportIconWidget: ListView.builder(
                                      itemCount:
                                          venueData.sportFacility!.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Icon(
                                          Sports.spots(
                                            sport: venueData
                                                .sportFacility![index].sport!,
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
                    );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
