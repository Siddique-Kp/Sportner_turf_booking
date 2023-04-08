import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              ))
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
                  child: Row(
                    children: [
                      MySize.kWidth20,
                      SportsNameCard(
                        sports: "Football",
                        onTap: () {},
                        color: SportsColor.cFootball,
                        child: const Icon(Icons.sports_soccer),
                      ),
                      MySize.kWidth10,
                      SportsNameCard(
                        sports: "Cricket",
                        onTap: () {},
                        color: SportsColor.cCricket,
                        child: const Icon(Icons.sports_cricket),
                      ),
                      MySize.kWidth10,
                      SportsNameCard(
                        sports: "Basketball",
                        onTap: () {},
                        color: SportsColor.cBasketBall,
                        child: const Icon(
                          Icons.sports_basketball,
                          color: Color.fromARGB(255, 188, 130, 78),
                        ),
                      ),
                      MySize.kWidth10,
                      SportsNameCard(
                        sports: "Vollyball",
                        onTap: () {},
                        color: SportsColor.cVolleyBall,
                        child: const Icon(Icons.sports_volleyball),
                      ),
                      MySize.kWidth10,
                      SportsNameCard(
                          sports: "Badminton",
                          onTap: () {},
                          color: SportsColor.cBadminton,
                          child: const Icon(CupertinoIcons.sportscourt)),
                    ],
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
