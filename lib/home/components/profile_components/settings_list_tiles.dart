import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/normal_alert_box.dart';
import 'package:sporter_turf_booking/home/view_model/bottom_nav_view_model.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import 'package:sporter_turf_booking/utils/secrets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../user_authentications/view_model/firebase_auth_view_model.dart';
import '../../model/user_profile_data_modle.dart';
import 'profile_settings_list_tile.dart';

class SettingsListTile extends StatelessWidget {
  final UserProfileDataModle userData;
  const SettingsListTile({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileSettings(
          title: "My Bookings",
          subtitle: "View all your bookings",
          icon: Icons.calendar_month,
          onTap: () {
            Navigator.pushNamed(context, NavigatorClass.myBookingsView);
          },
        ),
        ProfileSettings(
          title: "My Wallet",
          subtitle: "Wallet balance: ₹${userData.wallet}",
          icon: Icons.account_balance_wallet,
          onTap: () {},
        ),
        ProfileSettings(
          title: "Help & Support",
          subtitle: "Contact us on whatsapp",
          icon: Icons.help,
          onTap: () {
            openWhatsappChat(myMobile);
          },
        ),
        ProfileSettings(
          title: "Invite a friend",
          subtitle: "Share the sportner App",
          icon: Icons.share,
          onTap: () {},
        ),
        ProfileSettings(
          title: "Rate us",
          subtitle: "Rate the Sportner App",
          icon: Icons.star,
          onTap: () {},
        ),
        ProfileSettings(
          title: "Logout",
          icon: Icons.logout,
          onTap: () {
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
          },
        ),
        // ProfileSettings(
        //   title: "Delete My Account",
        //   icon: Icons.delete_forever,
        //   onTap: () {},
        // ),
      ],
    );
  }

  void openWhatsappChat(String phoneNumber) async {
    String whatsappUrl = 'https://wa.me/$phoneNumber';
    try {
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
