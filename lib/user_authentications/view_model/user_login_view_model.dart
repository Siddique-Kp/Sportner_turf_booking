import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/data/response/status.dart';
import 'package:sporter_turf_booking/repository/user_auth_repository/user_login_repository.dart';
import 'package:sporter_turf_booking/user_authentications/components/snackbar.dart';
import 'package:sporter_turf_booking/user_authentications/model/user_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/utils/keys.dart';
import '../../utils/constants.dart';
import '../../utils/routes/navigations.dart';

class UserLoginViewModel with ChangeNotifier {
  TextEditingController loginPhoneCntrllr = TextEditingController();
  TextEditingController loginPasswordCntrllr = TextEditingController();

  bool _isShowPassword = true;
  bool _isLoading = false;

  bool get isShowPassword => _isShowPassword;
  bool get isLoading => _isLoading;

  final _myRepo = UserLoginRepository();

  setShowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  getLoginStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    _myRepo
        .getUserLogin(
          url: Urls.kUSERSIGNIN,
          body: userDataBody(),
        )
        .then(
          (value) => {
            setLoginResponse(
              ApiResponse.completed(value),
              context,
            ),
            clearController(),
            navigator.pushReplacementNamed(NavigatorClass.mainScreen),
          },
        )
        .onError(
          (error, stackTrace) => {
            setLoginResponse(
              ApiResponse.error(error.toString()),
              context,
            ),
            clearPassword(),
          },
        );
    setLoading(false);
  }

  clearController() {
    loginPhoneCntrllr.clear();
    loginPasswordCntrllr.clear();
  }

  clearPassword() {
    loginPasswordCntrllr.clear();
  }

  setLoginResponse(ApiResponse<UserLoginModel> response, BuildContext context) {
    if (response.status == Status.completed) {
      setLoginStatus(response.data!.accessToken!);
    } else if (response.status == Status.error) {
      SnackBarWidget.snackBar(context, response.message.toString());
    }
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
}
