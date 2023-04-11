import 'package:flutter/material.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';

class AppBarWidget extends StatelessWidget {
  final bool isVenueScreen;
  final bool isProfileScreen;
  final GestureTapCallback? searchPressed;
  final GestureTapCallback? filterPressed;
  const AppBarWidget({
    super.key,
    this.isVenueScreen = false,
    this.isProfileScreen = false,
    this.searchPressed,
    this.filterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      centerTitle: false,
      title: !isProfileScreen
          ? Row(
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
            )
          : const Text(
              "Profile",
              style:
                  TextStyle(color: MyColors.black, fontWeight: FontWeight.w600),
            ),
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
