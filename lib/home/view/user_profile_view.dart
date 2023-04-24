import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/profile_components/user_profile_container.dart';
import 'package:sporter_turf_booking/home/model/user_profile_data_modle.dart';
import 'package:sporter_turf_booking/home/view_model/user_profile_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import '../../utils/textstyles.dart';
import '../components/profile_components/settings_list_tiles.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProfileViewModel>().getUserProfileData();
    });
    log("Buildeingggggg");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text("Profile", style: AppTextStyles.appbarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<UserProfileDataModle>(
                future:
                    context.read<UserProfileViewModel>().getUserProfileData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    log(snapshot.data.toString());
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileContainer(
                        userData: snapshot.data!,
                      ),
                      AppSizes.kHeight20,
                       SettingsListTile(userData:snapshot.data!)
                    ],
                  );
                }),
            const Text(
              "Version 1.0.0",
              style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
