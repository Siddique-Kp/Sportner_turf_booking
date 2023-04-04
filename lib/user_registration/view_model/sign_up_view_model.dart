import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/user_registration/components/snackbar.dart';
import 'package:sporter_turf_booking/user_registration/model/login_error_model.dart';
import 'package:sporter_turf_booking/user_registration/repo/api_services.dart';
import 'package:sporter_turf_booking/utils/constants.dart';

import '../../utils/keys.dart';
import '../../utils/navigations.dart';
import '../model/user_signup_model.dart';
import '../repo/api_status.dart';

class SignUpViewModel with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();

  bool _isShowPassword = true;
  bool _isShowConfPassword = true;
  bool _isLoading = false;
  SignUpError? _signUpError;
  UserSignupModel? _userData;

  bool get isShowPassword => _isShowPassword;
  bool get isShowConfPassword => _isShowConfPassword;
  bool get isLoading => _isLoading;
  UserSignupModel get userData => _userData!;
  SignUpError get signUpError => _signUpError!;

  setshowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  setshowConfPassword() {
    _isShowConfPassword = !_isShowConfPassword;
    notifyListeners();
  }

  checkTextFieldisEmpty() {
    notifyListeners();
  }

  clearTextField() {
    userNameController.clear();
    phoneController.clear();
    passController.clear();
    confirfPassController.clear();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  Future<UserSignupModel?> setUserData(UserSignupModel userData) async {
    _userData = userData;
    return _userData;
  }

  setLoginError(SignUpError signUpError) async {
    if (_signUpError == null) {
      return;
    }
    _signUpError = signUpError;
  }

  getSignUpStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    if (FirebaseAuth.instance.currentUser!.phoneNumber ==
        "+91${phoneController.text}") {
      return SnackBarWidget.snackBar(
          context, "User with this mobile number already exists");
    }
    log("${FirebaseAuth.instance.currentUser!.phoneNumber}");
    final response = await ApiServices.postMethod(
      Urls.kBASEURL + Urls.kUSERSIGNUP,
      userDatabody(),
      userSignupModelFromJson,
    );
    if (response is Success) {
      log("success");
      final data = await setUserData(response.response as UserSignupModel);
      final accessToken = data!.accessToken;
      clearTextField();
      setSignupStatus(accessToken!);
      await FirebaseAuth.instance.currentUser!.delete();
      navigator.pushNamedAndRemoveUntil(
          NavigatorClass.homeScreen, (route) => false);
    }
    if (response is Failure) {
      log("Failed");
      SignUpError loginError = SignUpError(
        code: response.code,
        message: response.errorResponse,
      );
      await setLoginError(loginError);
      clearPassword();
    }
    setLoading(false);
  }

  setSignupStatus(accessToken) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool(GlobalKeys.userSignedUp, true);
    await status.setString(GlobalKeys.accesToken, accessToken);
  }

  clearPassword() {
    passController.clear();
    confirfPassController.clear();
  }

  Map<String, dynamic> userDatabody() {
    final body = UserSignupModel(
      name: userNameController.text,
      mobile: phoneController.text,
      password: passController.text,
    );
    return body.toJson();
  }
}
