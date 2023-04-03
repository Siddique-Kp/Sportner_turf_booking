import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/user_registration/model/login_error_model.dart';
import 'package:sporter_turf_booking/user_registration/model/user_login_model.dart';
import 'package:sporter_turf_booking/user_registration/repo/api_status.dart';
import 'package:sporter_turf_booking/user_registration/repo/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/utils/keys.dart';
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

  Future<UserLoginModel?> setUserData(UserLoginModel userData) async {
    _userData = userData;
    return _userData;
  }

  setLoginError(LoginError loginError) async {
    if (_loginError == null) {
      return;
    }
    _loginError = loginError;
  }

  getLoginStatus(BuildContext context) async {
    setLoading(true);
    final response = await UserLogInService.userLogin(context);

    if (response is Success) {
      final data = await setUserData(response.response as UserLoginModel);
      final accessToken = data!.accessToken;
      clearController();
      setLoginStatus(accessToken!);
      Navigator.pushNamed(context, NavigatorClass.homeScreen);
    }

    if (response is Failure) {
      LoginError loginError = LoginError(
        code: response.code,
        message: response.errorResponse,
      );
      await setLoginError(loginError);
    }
    setLoading(false);
  }

  clearController() {
    loginPhoneCntrllr.clear();
    loginPasswordCntrllr.clear();
  }

  setLoginStatus(String accessToken) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool(GlobalKeys.userLoggedIN, true);
    await status.setString(GlobalKeys.accesToken, accessToken);
  }
}
