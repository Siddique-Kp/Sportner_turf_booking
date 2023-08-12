import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/data/response/status.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import '../../repository/user_auth_repository/user_signup_repository.dart';
import '../../utils/keys.dart';
import '../../utils/routes/navigations.dart';
import '../components/snackbar.dart';
import '../model/user_signup_model.dart';

class SignUpViewModel with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();

  bool _isShowPassword = true;
  bool _isShowConfPassword = true;
  UserSignupModel? _userData;

  bool get isShowPassword => _isShowPassword;
  bool get isShowConfPassword => _isShowConfPassword;
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

  Future<UserSignupModel?> setUserData(UserSignupModel userData) async {
    _userData = userData;
    return _userData;
  }

  bool? getMobileExist(BuildContext context) {
    _myRepo.getIsMobielExist(
        url: Urls.kIsMobileExist,
        body: {"mobile": phoneController.text.trim()}).then((value) {
      return false;
    }).onError((error, stackTrace) {
      SnackBarWidget.snackBar(context, error.toString());
      return true;
    });
    return null;
  }

  getSignUpStatus(BuildContext context) async {
    final navigator = Navigator.of(context);

    _myRepo
        .getUserSignUp(
          url: Urls.kBASEURL + Urls.kUSERSIGNUP,
          body: userDatabody(),
        )
        .then(
          (value) => {
            log("success"),
            setSignupResponse(
              ApiResponse.completed(value),
              context,
            ),
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
  }

  setSignupResponse(
    ApiResponse<UserSignupModel> response,
    BuildContext context,
  ) {
    if (response.status == Status.completed) {
      setSignupStatus(response.data!.accessToken!);
    } else if (response.status == Status.error) {
      if (response.message!.contains("mobile - already exist")) {
        SnackBarWidget.snackBar(
            context, "User with this mobile number already exists");
      } else {
        SnackBarWidget.snackBar(context, response.message.toString());
      }
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
}
