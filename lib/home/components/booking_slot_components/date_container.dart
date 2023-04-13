import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/booking_slot_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';

import '../../../utils/textstyles.dart';

class DateContainerWidget extends StatefulWidget {
  const DateContainerWidget({
    super.key,
  });

  @override
  State<DateContainerWidget> createState() => _DateContainerWidgetState();
}

class _DateContainerWidgetState extends State<DateContainerWidget> {
  List<DateTime> _dates = [];
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();

    // Initialize _dates to show the next five days
    DateTime now = DateTime.now();
    for (int i = 0; i < 5; i++) {
      _dates.add(now.add(Duration(days: i)));
    }

    // Initialize _selectedDate to the current date
    _selectedDate = now;
  }

  @override
  Widget build(BuildContext context) {
    final bookingSlotViewModel = context.read<BookingSlotViewModel>();
    final bookingSlotViewModelWatch = context.watch<BookingSlotViewModel>();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   // Initialize _dates to show the next five days
    //   DateTime now = DateTime.now();
    //   for (int i = 0; i < 5; i++) {
    //     _dates.add(now.add(Duration(days: i)));
    //   }

    //   // Initialize _selectedDate to the current date
    //   _selectedDate = now;
    // });
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Row(
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => MySize.kWidth5,
            itemBuilder: (context, index) {
              return _dateContainer(index, context);
            },
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate:
                      bookingSlotViewModelWatch.selectedInitialDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    bookingSlotViewModel.setDate(selectedDate);
                  }
                });
              },
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateContainer(index, BuildContext context) {
    final bookingSlotViewModel = context.read<BookingSlotViewModel>();
    final bookingSlotViewModelWatch = context.watch<BookingSlotViewModel>();
    return GestureDetector(
      onTap: () {
        bookingSlotViewModel.setSelectedDate(_dates[index]);
      },
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bookingSlotViewModelWatch.selectedInitialDate == _dates[index]
              ? MyColors.appColor
              : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(DateFormat('MMM').format(_dates[index]),
                  style: AppTextStyles.mediumTexth1),
              Text(_dates[index].day.toString(),
                  style: AppTextStyles.mediumTexth1),
              Text(DateFormat('EEE').format(_dates[index]).toUpperCase(),
                  style: AppTextStyles.mediumTexth1)
            ],
          ),
        ),
      ),
    );
  }
}
