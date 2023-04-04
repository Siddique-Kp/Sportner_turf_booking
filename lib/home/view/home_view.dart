import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/utils/navigations.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kozhikode"),
        actions: [
          IconButton(
              onPressed: () async {
                log("Got");
                context.read<FirebaseAuthViewModel>().userLoginStatus(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          "Welcome back",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
