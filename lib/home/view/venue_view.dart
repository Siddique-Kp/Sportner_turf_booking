import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/components/home_components.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';

class VenueScreenView extends StatelessWidget {
  const VenueScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: MyColors.black,
            ),
            MySize.kWidth10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Kozhikode",
                  style: TextStyle(
                      color: MyColors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Kerala,India",
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: const Icon(
              Icons.search,
              color: MyColors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: const Icon(
              Icons.tune,
              color: MyColors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => MySize.kHeight20,
            itemBuilder: (context, index) {
              return Container(
                // color: Colors.amber,
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/turf_1.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        MySize.kWidth10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.30,
                              child: const Text(
                                "Hennur turf park",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.sports_soccer,
                                  size: 17,
                                ),
                                Icon(
                                  Icons.sports_cricket,
                                  size: 18,
                                ),
                              ],
                            ),
                            const RatingStarWidget(
                              size: 13,
                              value: 3,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  size: 17,
                                ),
                                Text("Banglore")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "Starting from",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: MyColors.grey),
                            ),
                            Text(
                              "₹ 1000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: MyColors.black),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: SizedBox(
                            height: 30,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(elevation: 0),
                                onPressed: () {},
                                child: const Text("View")),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
