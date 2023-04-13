import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/user_registration/components/snackbar.dart';
import 'package:sporter_turf_booking/user_registration/model/error_response_model.dart';
import 'package:sporter_turf_booking/user_registration/model/user_login_model.dart';
import 'package:sporter_turf_booking/repo/api_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/utils/keys.dart';
import '../../utils/constants.dart';
import '../../utils/routes/navigations.dart';

class UserLoginViewModel with ChangeNotifier {
  TextEditingController loginPhoneCntrllr = TextEditingController();
  TextEditingController loginPasswordCntrllr = TextEditingController();

  bool _isShowPassword = true;
  bool _isLoading = false;
  UserLoginModel? _userData;
  ErrorResponseModel? _loginError;

  bool get isShowPassword => _isShowPassword;
  bool get isLoading => _isLoading;
  UserLoginModel? get userData => _userData;
  ErrorResponseModel? get loginError => _loginError;

  setShowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  Future<UserLoginModel?> setUserData(UserLoginModel userData) async {
    _userData = userData;
    return _userData;
  }

  setLoginError(ErrorResponseModel loginError, context) async {
    _loginError = loginError;
    return errorResonses(_loginError!, context);
  }

  getLoginStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    final response = await ApiServices.postMethod(
      Urls.kUSERSIGNIN,
        userDataBody(),
        userLoginModelFromJson);

    if (response is Success) {
      final data = await setUserData(response.response as UserLoginModel);
      final accessToken = data!.accessToken;
      log(accessToken.toString());
      clearController();
      await setLoginStatus(accessToken!);
      navigator.pushReplacementNamed(NavigatorClass.mainScreen);
    }

    if (response is Failure) {
      setLoading(false);
      clearPassword();
      ErrorResponseModel loginError = ErrorResponseModel(
        code: response.code,
        message: response.errorResponse,
      );
      setLoginError(loginError, context);
    }
    setLoading(false);
  }

  clearController() {
    loginPhoneCntrllr.clear();
    loginPasswordCntrllr.clear();
  }

  clearPassword() {
    loginPasswordCntrllr.clear();
  }

  setLoginStatus(String accessToken) async {
    final status = await SharedPreferences.getInstance();
    status.setBool(GlobalKeys.userLoggedIN, true);
    status.setString(GlobalKeys.accesToken, accessToken);
  }

  Map<String, dynamic> userDataBody() {
    final body = UserLoginModel(
      mobile: loginPhoneCntrllr.text,
      password: loginPasswordCntrllr.text,
    );

    return body.toJson();
  }

  errorResonses(ErrorResponseModel loginError, BuildContext context) {
    final statusCode = loginError.code;
    if (statusCode == 401) {
      return SnackBarWidget.snackBar(context, "Invalid username or password");
    }
    return SnackBarWidget.snackBar(context, loginError.message.toString());
  }
}
