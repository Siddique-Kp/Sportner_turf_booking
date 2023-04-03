import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final userLoginViewModel = context.watch<UserLoginViewModel>();
    final userData = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kozhikode"),
        actions: [
          IconButton(
              onPressed: () async {
                if (FirebaseAuth.instance.currentUser != null) {
                  context.read<FirebaseAuthViewModel>().firebaseGoogleLogout();
                } else {
                  log("user normally logged out");
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
