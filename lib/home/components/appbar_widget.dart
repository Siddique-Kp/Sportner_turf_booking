import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';

class AppBarWidget extends StatelessWidget {
  final bool isVenueScreen;
  final bool isProfileScreen;
  final bool isHomeAppBar;
  final bool isNormalAppbar;
  final String title;
  final GestureTapCallback? searchPressed;
  final GestureTapCallback? filterPressed;
  const AppBarWidget({
    super.key,
    this.isVenueScreen = false,
    this.isProfileScreen = false,
    this.isNormalAppbar = false,
    this.isHomeAppBar = false,
    this.title = "",
    this.searchPressed,
    this.filterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      centerTitle: false,
      leading: isNormalAppbar
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: MyColors.black,
              ))
          : MySize.kHeight10,
      title: isHomeAppBar
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  color: MyColors.black
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
            )
          : isProfileScreen
              ? Text("Profile", style: AppTextStyles.appbarTitle)
              : isNormalAppbar
                  ? Text(title, style: AppTextStyles.appbarTitle)
                  : MySize.kHeight10,
      actions: isVenueScreen
          ? [
              IconButton(
                onPressed: searchPressed,
                splashColor: Colors.transparent,
                icon: const Icon(
                  Icons.search,
                  color: MyColors.black,
                ),
              ),
              IconButton(
                onPressed: filterPressed,
                splashColor: Colors.transparent,
                icon: const Icon(
                  Icons.tune,
                  color: MyColors.black,
                ),
              ),
            ]
          : null,
    );
  }
}
