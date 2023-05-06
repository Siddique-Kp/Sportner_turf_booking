import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/user_registration/model/error_response_model.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/utils/constants.dart';

import '../../utils/keys.dart';
import '../../utils/routes/navigations.dart';
import '../components/snackbar.dart';
import '../model/user_signup_model.dart';
import '../../repo/api_status.dart';

class SignUpViewModel with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();

  bool _isShowPassword = true;
  bool _isShowConfPassword = true;
  bool _isLoading = false;
  ErrorResponseModel? _signUpError;
  UserSignupModel? _userData;

  bool get isShowPassword => _isShowPassword;
  bool get isShowConfPassword => _isShowConfPassword;
  bool get isLoading => _isLoading;
  UserSignupModel get userData => _userData!;
  ErrorResponseModel get signUpError => _signUpError!;

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

  setLoginError(ErrorResponseModel signUpError, context) async {
    _signUpError = signUpError;
    return errorResonses(_signUpError!, context);
  }

  getSignUpStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    final response = await ApiServices.postMethod(
      url: Urls.kBASEURL + Urls.kUSERSIGNUP,
      body: userDatabody(),
      jsonDecode: userSignupModelFromJson,
    );
    if (response is Success) {
      log("success");
      final data = await setUserData(response.response as UserSignupModel);
      final accessToken = data!.accessToken;
      clearTextField();
      setSignupStatus(accessToken!);
      navigator.pushNamedAndRemoveUntil(
          NavigatorClass.mainScreen, (route) => false);
    }
    if (response is Failure) {
      log("Failed");
      ErrorResponseModel signUpError = ErrorResponseModel(
        code: response.code,
        message: response.errorResponse,
      );
      setLoginError(signUpError, context);
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

  errorResonses(ErrorResponseModel signUperror, BuildContext context) {
    final statusCode = signUperror.code;
    if (statusCode == 409) {
      return SnackBarWidget.snackBar(
          context, "User with this mobile number already exists");
    }
    return SnackBarWidget.snackBar(context, signUperror.message.toString());
  }
}
