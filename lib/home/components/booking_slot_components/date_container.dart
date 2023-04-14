import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';


class DateContainerWidget extends StatelessWidget {
  const DateContainerWidget({
    super.key,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    final bookingSlotViewModel = context.read<BookingSlotViewModel>();
    final bookingSlotViewModelWatch = context.watch<BookingSlotViewModel>();
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
            separatorBuilder: (context, index) => MySize.kWidth5,
            itemBuilder: (context, index) {
              return _dateContainer(index, context, size);
            },
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: bookingSlotViewModelWatch.selectedDate ??
                      DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: MyColors.appColor,
                        buttonTheme: const ButtonThemeData(
                            textTheme: ButtonTextTheme.primary,
                            buttonColor: MyColors.appColor),
                        colorScheme:
                            const ColorScheme.light(primary: MyColors.appColor)
                                .copyWith(secondary: MyColors.appColor),
                      ),
                      child: child!,
                    );
                  },
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    bookingSlotViewModel.setDate(selectedDate);
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
    final bookingSlotViewModel = context.read<BookingSlotViewModel>();
    final bookingSlotViewModelWatch = context.watch<BookingSlotViewModel>();
    final dates = bookingSlotViewModelWatch.dates;
    final dateStyle = TextStyle(
        color: bookingSlotViewModelWatch.selectedDate == dates[index]
            ? MyColors.white
            : Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14);
    return GestureDetector(
      onTap: () {
        bookingSlotViewModel.setSelectedDate(dates[index]);
      },
      child: Container(
        width: size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(
            color: bookingSlotViewModelWatch.selectedDate == dates[index]
                ? MyColors.appColor
                : MyColors.black,
            width: bookingSlotViewModelWatch.selectedDate == dates[index]
                ? 2
                : 1,
          ),
          borderRadius: BorderRadius.circular(6),
          color: bookingSlotViewModelWatch.selectedDate == dates[index]
              ? MyColors.appColor
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
