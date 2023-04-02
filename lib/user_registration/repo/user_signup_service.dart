import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/view_model/sign_up_view_model.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class UserSignUpService{
   static Future createUser(BuildContext context) async {
    final userSignupViewModel = context.read<SignUpViewModel>();
    final uri = Uri.parse(Urls.BASE_URL + Urls.USER_SIGNIN);

    final response = await http.post(
      uri,
      body: {
        "name":userSignupViewModel.userNameController.text,
        "mobile": userSignupViewModel.phoneController.text,
        "password": userSignupViewModel.passController.text
      },
    );

    if (response.statusCode == 200) {}
    log(response.body.toString());
  }

}