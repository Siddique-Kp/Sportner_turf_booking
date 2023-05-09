import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../../utils/textstyles.dart';
import '../../model/venue_data_model.dart';

class TimeManageWidget extends StatelessWidget {
  const TimeManageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bookingViewModel = context.watch<BookingSlotViewModel>();
    // final venueViewModel = context.watch<VenueDetailsViewModel>();
    String chosenTime = bookingViewModel.selectedTime;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("From", style: AppTextStyles.textH2),
            AppSizes.kHeight20,
            _timeContainer(
              context,
              isFromSlot: true,
              choosenTime: bookingViewModel
                  .convertTo12HourFormat(chosenTime.split("-").first),
            ),
          ],
        ),
        Container(
          height: 90,
          width: 1.5,
          color: AppColors.black,
        ),
        Column(
          children: [
            Text("To", style: AppTextStyles.textH2),
            AppSizes.kHeight20,
            _timeContainer(
              context,
              isFromSlot: false,
              choosenTime: bookingViewModel
                  .convertTo12HourFormat(chosenTime.split("-").last),
            )
          ],
        )
      ],
    );
  }

  Widget _timeContainer(
    BuildContext context, {
    required String choosenTime,
    required bool isFromSlot,
  }) {
    return GestureDetector(
      onTap: () async {
        if (isFromSlot) {
          _showSlotsBottomSheet(context, true);
        } else if (!isFromSlot) {
          _showSlotsBottomSheet(context, false);
        }
      },
      child: Container(
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.lightGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(choosenTime, style: AppTextStyles.textH4),
                AppSizes.kWidth5,
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

  _showSlotsBottomSheet(BuildContext context, bool isFromSlot) {
    final venueViewModel = context.read<VenueDetailsViewModel>();
    final bookingViewModel = context.read<BookingSlotViewModel>();

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        List<Slots> venueDataSlot = venueViewModel.venueData.slots!;
        return Container(
          margin: const EdgeInsets.all(20),
          child: venueDataSlot[venueViewModel.dayIndex].slots!.isEmpty
              ? Wrap(
                  children: [
                    Center(
                        child: Text("No Slots", style: AppTextStyles.textH4)),
                  ],
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 45,
                  ),
                  shrinkWrap: true,
                  itemCount:
                      venueDataSlot[venueViewModel.dayIndex].slots!.length,
                  itemBuilder: (BuildContext context, int slotIndex) {
                    final canSelectTimeslot =
                        bookingViewModel.canSelectTimeSlot(
                      isFromSlot: isFromSlot,
                      slotIndex: slotIndex,
                      context: context,
                    );

                    final isBookedSlot = bookingViewModel.slotAvailability.any(
                        (element) =>
                            element.slotTime ==
                            venueDataSlot[venueViewModel.dayIndex]
                                .slots![slotIndex]);
                    return InkWell(
                      onTap: canSelectTimeslot && !isBookedSlot
                          ? () {
                              bookingViewModel.setSelectedTime(
                                venueDataSlot[venueViewModel.dayIndex]
                                    .slots![slotIndex],
                              );
                              Navigator.pop(context);
                            }
                          : null,
                      child: Material(
                        elevation:isBookedSlot?0: 1,
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: isBookedSlot
                                ? AppColors.red
                                : AppColors.lightGrey,
                          ),
                          child: Center(
                            child: Text(
                              bookingViewModel.convertTo12HourFormat(
                                  bookingViewModel.timeSlotText),
                              style: TextStyle(
                                color: isBookedSlot
                                    ? AppColors.grey
                                    : canSelectTimeslot
                                        ? AppColors.black
                                        : AppColors.lightGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
