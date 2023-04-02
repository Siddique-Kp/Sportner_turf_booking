import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/user_registration/model/login_error_model.dart';
import 'package:sporter_turf_booking/user_registration/model/user_login_model.dart';
import 'package:sporter_turf_booking/user_registration/repo/api_status.dart';
import 'package:sporter_turf_booking/user_registration/repo/user_login_service.dart';

import '../../utils/navigations.dart';

class UserLoginViewModel with ChangeNotifier {
  TextEditingController loginPhoneCntrllr = TextEditingController();
  TextEditingController loginPasswordCntrllr = TextEditingController();

  bool _isShowPassword = false;
  bool _isLoading = false;
  UserLoginModel? _userData;
  LoginError? _loginError;

  bool get isShowPassword => _isShowPassword;
  bool get isLoading => _isLoading;
  UserLoginModel get userData => _userData!;
  LoginError get loginError => _loginError!;

  setShowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setUserData(UserLoginModel userData) {
    _userData = userData;
  }

  setLoginError(LoginError loginError) {
    _loginError = loginError;
  }

  getLoginStatus(BuildContext context) async {
    setLoading(true);
    final response = await UserLogInService.userLogin(context);

    if (response is Success) {
      setUserData(response.response as UserLoginModel);
      // ignore: use_build_context_synchronously
      clearController();
      Navigator.pushNamed(context, NavigatorClass.homeScreen);
    }

    if (response is Failure) {
      LoginError loginError = LoginError(
        code: response.code,
        message: response.errorResponse,
      );
      // loginPasswordCntrllr.clear();
      setLoginError(loginError);
    }
    setLoading(false);
  }

  clearController() {
    loginPhoneCntrllr.clear();
    loginPasswordCntrllr.clear();
  }
}
