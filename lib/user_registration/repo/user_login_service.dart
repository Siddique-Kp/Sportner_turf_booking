import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/model/user_login_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserLogInService {
  static Future userLogin(BuildContext context) async {
    final userLoginViewModel = context.read<UserLoginViewModel>();
    final uri = Uri.parse(Urls.BASE_URL + Urls.USER_SIGNIN);

    final data = UserLoginModel(
      mobile: userLoginViewModel.loginPhoneCntrllr.text,
      password: userLoginViewModel.loginPasswordCntrllr.text,
    );


    final response = await http.post(
      uri,
      body: data.toJson()
    );

    if (response.statusCode == 200) {}
    log(response.body.toString());
  }
}
