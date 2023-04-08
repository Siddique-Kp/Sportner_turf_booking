import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/home_components.dart';
import 'package:sporter_turf_booking/home/components/sport_name_card.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.kWhiteColor,
        title: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: MyColors.kBlackColor,
            ),
            MySize.kWidth10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Kozhikode",
                  style: TextStyle(
                      color: MyColors.kBlackColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Kerala,India",
                  style: TextStyle(
                    color: MyColors.kBlackColor,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              context.read<FirebaseAuthViewModel>().userLoginStatus(context);
            },
            icon: const Icon(
              Icons.logout,
              color: MyColors.kBlackColor,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            height: 155,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      MySize.kHeight20,
                      Text(
                        "Hello Siddique",
                        style: TextStyle(
                            color: MyColors.kBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      MySize.kHeight10,
                      Text(
                        "Find your arena",
                        style: TextStyle(
                          color: MyColors.kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ),
                MySize.kHeight30,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: SportNameCard.sportItemsdata(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Near you",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text("View all"),
                ),
              ],
            ),
          ),
          MySize.kHeight20,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MySize.kWidth25,
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(width: 1, color: MyColors.kGreyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 90,
                        child: Image.asset(
                          "assets/turf_image.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      MySize.kHeight10,
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "The Java Stadium",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const Text(
                              "1.2 KM away",
                              style: TextStyle(
                                fontSize: 11,
                                color: MyColors.kGreyColor,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.sports_soccer_rounded,
                                  size: 19,
                                ),
                                Icon(
                                  Icons.sports_cricket_rounded,
                                  size: 22,
                                ),
                              ],
                            ),
                            const RatingStarWidget(value: 3)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
