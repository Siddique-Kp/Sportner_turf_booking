import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/data/response/status.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import '../../repository/user_auth_repository/user_signup_repository.dart';
import '../../utils/keys.dart';
import '../../utils/routes/navigations.dart';
import '../model/user_signup_model.dart';

class SignUpViewModel with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();

  bool _isShowPassword = true;
  bool _isShowConfPassword = true;
  bool _isLoading = false;
  UserSignupModel? _userData;

  bool get isShowPassword => _isShowPassword;
  bool get isShowConfPassword => _isShowConfPassword;
  bool get isLoading => _isLoading;
  UserSignupModel get userData => _userData!;

  final _myRepo = UserSignUpRepository();

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

  getSignUpStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);

    _myRepo
        .getUserSignUp(
          url: Urls.kBASEURL + Urls.kUSERSIGNUP,
          body: userDatabody(),
        )
        .then(
          (value) => {
            log("success"),
            setSignupResponse(ApiResponse.completed(value)),
            clearTextField(),
            navigator.pushNamedAndRemoveUntil(
                NavigatorClass.mainScreen, (route) => false),
          },
        )
        .onError(
          (error, stackTrace) => {
            log("Failed signup"),
            clearPassword(),
          },
        );
    setLoading(false);
  }

  setSignupResponse(ApiResponse<UserSignupModel> response) {
    if (response.status == Status.completed) {
      setSignupStatus(response.data!.accessToken!);
    }
  }

  setSignupStatus(String accessToken) async {
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

  // errorResonses(ErrorResponseModel signUperror, BuildContext context) {
  //   final statusCode = signUperror.code;
  //   if (statusCode == 409) {
  //     return SnackBarWidget.snackBar(
  //         context, "User with this mobile number already exists");
  //   }
  //   return SnackBarWidget.snackBar(context, signUperror.message.toString());
  // }
}
