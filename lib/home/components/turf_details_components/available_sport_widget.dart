import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/sports_icon.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../../utils/textstyles.dart';

class AvailableSportsWidget extends StatelessWidget {
  final VenueDataModel venueData;
  const AvailableSportsWidget({
    super.key,
    required this.venueData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Sports",
          style: AppTextStyles.textH3,
        ),
        AppSizes.kHeight20,
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: venueData.sportFacility!.length,
                separatorBuilder: (context, index) => AppSizes.kWidth10,
                itemBuilder: (BuildContext context, int index) {
                  return _soprtContainer(index, context, venueData);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _soprtContainer(
    int index,
    BuildContext context,
    VenueDataModel venueData,
  ) {
    final bookingSlotViewModel = context.watch<BookingSlotViewModel>();
    bool isSelected = index == bookingSlotViewModel.selectedSport;
    final icons = Sports.spots(sport: venueData.sportFacility![index].sport!);
    return InkWell(
      onTap: () {
        bookingSlotViewModel.setSelectedSport(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? AppColors.appColor : AppColors.lightGrey,
        ),
        width: 70.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
            AppSizes.kHeight10,
            Text(
              "Football",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: isSelected ? AppColors.white : AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
