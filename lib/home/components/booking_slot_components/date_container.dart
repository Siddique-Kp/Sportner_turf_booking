import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';

class DateContainerWidget extends StatelessWidget {
  const DateContainerWidget({
    super.key,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    final bookingViewModel = context.watch<BookingSlotViewModel>();
    final venueViewModel = context.watch<VenueDetailsViewModel>();
    venueViewModel.getDayIndex(DateFormat('EEEE')
        .format(bookingViewModel.selectedDate ?? DateTime.now()));
    // bookingViewModel.clearSelectedTime();

    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.075,
      width: double.infinity,
      child: Row(
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => AppSizes.kWidth5,
            itemBuilder: (context, index) {
              return _dateContainer(index, context, size);
            },
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: bookingViewModel.selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 15)),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: AppColors.appColor,
                        buttonTheme: const ButtonThemeData(
                            textTheme: ButtonTextTheme.primary,
                            buttonColor: AppColors.appColor),
                        colorScheme:
                            const ColorScheme.light(primary: AppColors.appColor)
                                .copyWith(secondary: AppColors.appColor),
                      ),
                      child: child!,
                    );
                  },
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    bookingViewModel.setDate(selectedDate);
                  }
                });
              },
              icon: const Icon(Icons.calendar_month_outlined, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateContainer(index, BuildContext context, Size size) {
    final bookingSlotViewModel = context.watch<BookingSlotViewModel>();
    final dates = bookingSlotViewModel.dates;
    final lastLimitDate = DateTime.now().add(const Duration(days: 15));
    bool isDateEnabled = true;
    if (dates[index].isAfter(lastLimitDate)) {
      isDateEnabled = false;
    }
    final dateStyle = TextStyle(
      color: !isDateEnabled
          ? AppColors.grey
          : bookingSlotViewModel.selectedDate == dates[index]
              ? AppColors.white
              : Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
    return GestureDetector(
      onTap: isDateEnabled
          ? () {
              bookingSlotViewModel.setSelectedDate(dates[index]);
            }
          : null,
      child: Container(
        width: size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(
            color: !isDateEnabled
                ? AppColors.lightGrey
                : bookingSlotViewModel.selectedDate == dates[index]
                    ? AppColors.appColor
                    : AppColors.black,
          ),
          borderRadius: BorderRadius.circular(6),
          color: bookingSlotViewModel.selectedDate == dates[index]
              ? AppColors.appColor
              : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(DateFormat('MMM').format(dates[index]), style: dateStyle),
              Text(dates[index].day.toString(), style: dateStyle),
              Text(DateFormat('EEE').format(dates[index]).toUpperCase(),
                  style: dateStyle)
            ],
          ),
        ),
      ),
    );
  }
}
