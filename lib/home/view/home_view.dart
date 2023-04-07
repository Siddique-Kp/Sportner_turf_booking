import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
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
        children: [
          Container(
            color: MyColors.kGreyColor,
            width: size.width,
            height: 200,
            child: Padding(
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
          ),
        ],
      ),
    );
  }
}
