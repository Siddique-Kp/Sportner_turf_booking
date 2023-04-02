import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final userLoginViewModel = context.watch<UserLoginViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kozhikode"),
      ),
      body:  Center(
        child: Text(
          userLoginViewModel.userData.name.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
