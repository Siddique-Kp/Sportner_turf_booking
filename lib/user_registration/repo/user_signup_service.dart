import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/model/user_signup_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/sign_up_view_model.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import 'api_status.dart';

class UserSignUpService {
  static Future<Object> createUser(BuildContext context) async {
    final userSignupViewModel = context.read<SignUpViewModel>();
    final uri = Uri.parse(Urls.kBASEURL + Urls.kUSERSIGNUP);

    final body = UserSignupModel(
      name: userSignupViewModel.userNameController.text,
      mobile: userSignupViewModel.phoneController.text,
      password: userSignupViewModel.passController.text,
    );

    try {
      final response = await http.post(uri, body: body.toJson());

      if (response.statusCode == 200) {
        Success(response: userSignupModelFromJson(response.body));
        log(response.body);
      }
      log(response.body.toString());
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
