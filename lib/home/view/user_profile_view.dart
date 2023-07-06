import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/data/response/status.dart';
import 'package:sporter_turf_booking/home/components/error_data_widget.dart';
import 'package:sporter_turf_booking/home/components/profile_components/user_profile_container.dart';
import 'package:sporter_turf_booking/home/view_model/user_profile_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import '../../user_authentications/view_model/firebase_auth_view_model.dart';
import '../../utils/textstyles.dart';
import '../components/normal_alert_box.dart';
import '../components/profile_components/settings_list_tiles.dart';
import '../view_model/bottom_nav_view_model.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Text("Profile", style: AppTextStyles.appbarTitle),
        actions: [
          context.watch<UserProfileViewModel>().userProfileModel?.status == Status.error?
          IconButton(onPressed: () {
            NormalAlertBox.alertBox(
                context: context,
                title: "Log out!",
                content: "Are you sure you want to log out?",
                onPressed: () {
                  context
                      .read<FirebaseAuthViewModel>()
                      .userLoginStatus(context);
                  context.read<BottomNavViewModel>().changeBottomNavindex(0);
                });
          }, icon: const Icon(Icons.logout)):const SizedBox()
        ],
      ),
      body: Consumer<UserProfileViewModel>(
        builder: (context, value, child) {
          log(value.userProfileModel!.status.toString());
          switch (value.userProfileModel?.status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.error:
              return const NoInternetWidget();
            case Status.completed:
              final userProfileData = value.userProfileModel!.data!;
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserProfileContainer(
                          userData: userProfileData,
                        ),
                        AppSizes.kHeight20,
                        SettingsListTile(
                          userData: userProfileData,
                        )
                      ],
                    ),
                    const Text(
                      "Version 1.0.0",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
