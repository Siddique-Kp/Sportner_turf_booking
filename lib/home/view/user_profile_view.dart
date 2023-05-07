import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/profile_components/user_profile_container.dart';
import 'package:sporter_turf_booking/home/view_model/user_profile_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import '../../utils/textstyles.dart';
import '../components/profile_components/settings_list_tiles.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userDataViewModel = context.watch<UserProfileViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Text("Profile", style: AppTextStyles.appbarTitle),
      ),
      body: userDataViewModel.errorResponse?.code == 101
          ? const Center(
              child: Text("NO Internet"),
            )
          : userDataViewModel.userProfileData == null
              ? const Center(
                  child: Text("Could not load data"),
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserProfileContainer(userData: userDataViewModel.userProfileData!),
                          AppSizes.kHeight20,
                          SettingsListTile(userData: userDataViewModel.userProfileData!)
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
                ),
    );
  }
}
