import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view/home_view.dart';
import 'package:sporter_turf_booking/home/view/user_profile_view.dart';
import 'package:sporter_turf_booking/home/view/venue_view.dart';
import 'package:sporter_turf_booking/home/view_model/home_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';

class BottomBarView extends StatelessWidget {
   BottomBarView({super.key});

 final List views = [
    const HomeScreenView(),
    const VenueScreenView(),
    const UserProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
       const SystemUiOverlayStyle(statusBarColor: MyColors.white));
    final bottomBarVieModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: views[bottomBarVieModel.bottomBarIndex],
      backgroundColor: MyColors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomBarVieModel.bottomOnChanged,
        currentIndex: bottomBarVieModel.bottomBarIndex,
        iconSize: 24,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: MyColors.white, 
        elevation: 5,
        selectedItemColor: MyColors.appColor,
        unselectedItemColor: MyColors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Venue",
            icon: InkResponse(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                CupertinoIcons.sportscourt,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person_outline_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
