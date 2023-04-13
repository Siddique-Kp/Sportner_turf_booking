import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/components/appbar_widget.dart';
import 'package:sporter_turf_booking/home/components/turf_details_components/available_sport_widget.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';
import '../components/booking_slot_components/date_container.dart';
import '../components/booking_slot_components/facility_widget.dart';

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
        child: Column(
          children: [
            const AvailableSportsWidget(),
            MySize.kHeight20,
            const Divider(thickness: 2, color: MyColors.black),
            MySize.kHeight20,
            const FacilityWidget(),
            MySize.kHeight20,
            const DateContainerWidget(),
            MySize.kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "From",
                      style: AppTextStyles.mediumTexth2,
                    ),
                    MySize.kHeight20,
                    Container(
                      width: 75,
                      height: 40,
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
                              Text("HH:MM", style: AppTextStyles.mediumTexth1),
                              const Expanded(
                                child: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 90,
                  width: 2,
                  color: MyColors.black,
                ),
                Column(
                  children: [
                    Text(
                      "To",
                      style: AppTextStyles.mediumTexth2,
                    ),
                    MySize.kHeight20,
                    Container(
                      width: 75,
                      height: 40,
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
                              Text("HH:MM", style: AppTextStyles.mediumTexth1),
                              const Expanded(
                                child: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: MyColors.grey))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "RS 1000.00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(elevation: 0),
                  child: const Text("BOOK NOW"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
