import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../../utils/textstyles.dart';

class TimeManageWidget extends StatelessWidget {
  const TimeManageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "From",
              style: AppTextStyles.mediumTexth2,
            ),
            MySize.kHeight20,
            _timeContainer(context, isFrom: true),
          ],
        ),
        Container(
          height: 90,
          width: 1.5,
          color: MyColors.black,
        ),
        Column(
          children: [
            Text(
              "To",
              style: AppTextStyles.mediumTexth2,
            ),
            MySize.kHeight20,
            _timeContainer(context, isFrom: false)
          ],
        )
      ],
    );
  }

  Widget _timeContainer(BuildContext context, {required bool isFrom}) {
    final bookingSlotViewModel = context.watch<BookingSlotViewModel>();
    String chosenTime = isFrom
        ? bookingSlotViewModel.selectedTimeFrom
        : bookingSlotViewModel.selectedTimeTo;
    return GestureDetector(
      onTap: () async {
        final selectedTime = await showTimePicker(
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: MyColors.appColor,
                buttonTheme: const ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                    buttonColor: MyColors.appColor),
                colorScheme: const ColorScheme.light(primary: MyColors.appColor)
                    .copyWith(secondary: MyColors.appColor),
              ),
              child: child!,
            );
          },
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (selectedTime != null) {
          if (isFrom) {
            bookingSlotViewModel
                .setSelectedTimeFrom(selectedTime.format(context).toString());
          } else {
            bookingSlotViewModel
                .setSelectedTimeTo(selectedTime.format(context).toString());
          }
        }
      },
      child: Container(
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(151, 213, 213, 213),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(chosenTime,
                    style: AppTextStyles.mediumTexth1),
                MySize.kWidth5,
                const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
