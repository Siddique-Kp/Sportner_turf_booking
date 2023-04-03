import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/utils/navigations.dart';

import '../../utils/keys.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // final userLoginViewModel = context.watch<UserLoginViewModel>();
    // final userData = FirebaseAuth.instance.currentUser;
    final navigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kozhikode"),
        actions: [
          IconButton(
              onPressed: () async {
                if (FirebaseAuth.instance.currentUser != null) {
                  context.read<FirebaseAuthViewModel>().firebaseGoogleLogout();
                } else {
                  SharedPreferences status =
                      await SharedPreferences.getInstance();
                  status.remove(GlobalKeys.userLoggedIN);
                  status.remove(GlobalKeys.accesToken);
                  navigator.pushNamedAndRemoveUntil(
                      NavigatorClass.loginScreen, (route) => false);
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          "welcome back",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
