import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/model/user_login_model.dart';
import 'package:sporter_turf_booking/user_registration/repo/api_status.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserLogInService {
  static Future<Object> userLogin(BuildContext context) async {
    final userLoginViewModel = context.read<UserLoginViewModel>();
    final uri = Uri.parse(Urls.kBASEURL + Urls.kUSERSIGNIN);

    try {
      final data = UserLoginModel(
        mobile: userLoginViewModel.loginPhoneCntrllr.text,
        password: userLoginViewModel.loginPasswordCntrllr.text,
      );
      log("1");
      final response = await http.post(uri, body: data.toJson());
      log(response.body.toString());

      if (response.statusCode == 200) {
        final responseData = userLoginModelFromJson(response.body);
        // log(responseData.mobile.toString());

        return Success(response: responseData);
      }
      log(response.statusCode.toString());

      return Failure(
        code: response.statusCode,
        errorResponse: "Invalid Response",
      );
    } on HttpException {
      return Failure(
        code: InvalidRespons.kNOINTERNET,
        errorResponse: "No internet",
      );
    } on FormatException {
      return Failure(
        code: InvalidRespons.kINVALIDFORMAT,
        errorResponse: "Invalid Format",
      );
    } catch (e) {
      return Failure(
        code: InvalidRespons.kUNKNOWNERROR,
        errorResponse: "Unknown Error",
      );
    }
  }
}
