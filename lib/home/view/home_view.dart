import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/home_components.dart';
import 'package:sporter_turf_booking/home/components/sport_name_card.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';

import '../components/venue_card_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Row(
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
      
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height*0.20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        MySize.kHeight20,
                        Text(
                          "Hello Siddique",
                          style: TextStyle(
                              color: MyColors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        MySize.kHeight10,
                        Text(
                          "Find your arena",
                          style: TextStyle(
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MySize.kHeight20,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: SportNameCard.sportItemsdata(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HomeComponents.viewAllText(
              lText: "Nearest Turf",
              onPressed: () {},
            ),
            MySize.kHeight20,
            SizedBox(
              // width: size.width,
              height: size.height*0.25,
              child: Row(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 165,
                      ),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding:  EdgeInsets.only(left: 15),
                          child: VenueCardWidget(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            MySize.kHeight20,
            HomeComponents.viewAllText(
              lText: "Turf with offers",
              onPressed: () {},
            ),
             SizedBox(
              width: size.width,
              height: 190,
              child: Row(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 165,
                      ),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding:  EdgeInsets.only(left: 15),
                          child: VenueCardWidget(isOffer: true,),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


