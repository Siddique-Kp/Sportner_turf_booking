import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/components/text_form_field.dart';
import 'package:sporter_turf_booking/user_registration/view_model/forget_password_view_model.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPassViewModel = context.watch<ForgetPassViewModel>();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
            child: ListView(
          children: [
            TextFormWidget(
                controller: forgetPassViewModel.newpasswordController,
                labelText: "New password",
                textFieldIcon: Icons.lock,
                keyType: TextInputType.text),
            TextFormWidget(
                controller: forgetPassViewModel.newConfpasswordController,
                labelText: "Confirm Password",
                textFieldIcon: Icons.lock,
                keyType: TextInputType.text),
            ElevatedButton(onPressed: () {}, child: const Text("SUBMIT"))
          ],
        )),
      ),
    );
  }
}
