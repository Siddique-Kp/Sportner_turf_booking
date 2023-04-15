import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';

class AvailableSportsWidget extends StatelessWidget {
  const AvailableSportsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => AppSizes.kWidth10,
            itemBuilder: (BuildContext context, int index) {
              return _soprtContainer(index, context);
            },
          ),
        ],
      ),
    );
  }

  Widget _soprtContainer(int index, BuildContext context) {
    final bookingSlotViewModel = context.watch<BookingSlotViewModel>();
    bool isSelected = index == bookingSlotViewModel.selectedSport;
    return InkWell(
      onTap: () {
        bookingSlotViewModel.setSelectedSport(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? MyColors.appColor : MyColors.lightGrey,
        ),
        width: 70.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_soccer,
              color: isSelected ? MyColors.white : MyColors.black,
            ),
            AppSizes.kHeight10,
            Text(
              "Football",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: isSelected ? MyColors.white : MyColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
