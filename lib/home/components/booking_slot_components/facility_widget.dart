import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';

class FacilityWidget extends StatelessWidget {
  const FacilityWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text("Facility", style: AppTextStyles.mediumTexth2),
          ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _radioButton(index,context);
            },
          )
        ],
      ),
    );
  }

  Widget _radioButton(int index,BuildContext context ) {
    final bookingSlotViewModel = context.watch<BookingSlotViewModel>();

    final values = ["5 v 5", "7 v 7", "11 v 11"];
    return Row(
      children: [
        Radio(
          value: values[index],
          groupValue: bookingSlotViewModel.selectedRadioButton,
          activeColor: MyColors.appColor,
          onChanged: (value) {
            bookingSlotViewModel.setRadioButton(value.toString());
          },
        ),
        Text(values[index])
      ],
    );
  }
}
