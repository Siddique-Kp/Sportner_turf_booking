import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';

class FacilityWidget extends StatelessWidget {
  const FacilityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final bookingSlotViewModel = context.watch<BookingSlotViewModel>();
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text("Facility", style: AppTextStyles.textH2),
        bookingSlotViewModel.facility.isEmpty ?AppSizes.kWidth5 :_radioButton(context)
        ],
      ),
    );
  }

  Widget _radioButton(BuildContext context) {
    final bookingSlotViewModel = context.watch<BookingSlotViewModel>();
    final value = bookingSlotViewModel.facility;
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: bookingSlotViewModel.selectedRadioButton,
          activeColor: AppColors.appColor,
          onChanged: (value) {
            bookingSlotViewModel.setRadioButton(value.toString());
          },
        ),
        Text(value)
      ],
    );
  }
}
