import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/components/appbar_widget.dart';
import 'package:sporter_turf_booking/home/components/turf_details_components/available_sport_widget.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';
import '../components/booking_slot_components/date_container.dart';
import '../components/booking_slot_components/facility_widget.dart';
import '../components/booking_slot_components/time_manage_widget.dart';

class BookingSlotView extends StatelessWidget {
  const BookingSlotView({super.key});

  @override
  Widget build(BuildContext context) {
    log("Rebuildeed");
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          isNormalAppbar: true,
          title: "Bookings",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvailableSportsWidget(),
              MySize.kHeight20,
              const Divider(thickness: 2, color: MyColors.black),
              MySize.kHeight20,
              const FacilityWidget(),
              MySize.kHeight20,
              Text("Select Date",style: AppTextStyles.mediumTexth2,),
              MySize.kHeight20,
              const DateContainerWidget(),
              MySize.kHeight30,
              const TimeManageWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Color.fromARGB(67, 158, 158, 158)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total : 1000.00",
                style: TextStyle(fontWeight: FontWeight.bold,color: MyColors.appColor, fontSize: 20),
              ),
              SizedBox(
                height: 44,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(elevation: 0),
                  child: const Text("NEXT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


