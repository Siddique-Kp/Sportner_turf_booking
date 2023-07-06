import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/glass_snack_bar.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/repository/user_auth_repository/forgot_password_repository.dart';
import 'package:sporter_turf_booking/user_registration/view/login_view.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import '../../utils/routes/navigations.dart';
import '../components/snackbar.dart';

class ForgetPassViewModel with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController newConfpasswordController =
      TextEditingController();

  bool _isLoadingOtp = false;
  bool _isLoading = false;
  bool get isLoadingotp => _isLoadingOtp;
  bool get isLoading => _isLoading;

  final _myRepo = ForgotPasswordRepoitory();

  Future getForgetPassStatus(BuildContext context) async {
    setLoadingOtp(true);
    log(phoneController.text);
    _myRepo
        .getForgotPass(url: Urls.kFORGOTPASSmob + phoneController.text)
        .then(
          (value) => {
            print(value),
            context
                .read<FirebaseAuthViewModel>()
                .fireBasePhoneAuth(context, phoneController.text, true),
            setLoadingOtp(false),
          },
        )
        .onError(
          (error, stackTrace) => {
            log(error.toString()),
            setLoadingOtp(false),
            SnackBarWidget.snackBar(context, error.toString()),
          },
        );
  }

  setNewPassword(context) async {
    setLoading(true);
    _myRepo
        .setNewPass(url: Urls.kFORGOTPASS, body: newPassBody())
        .then((value) => {
              setLoading(false),
              GlassSnackBar.snackBar(
                  context: context,
                  title: "Password Changed successfully!",
                  subtitle: "Please login again to continue!"),
              Future.delayed(const Duration(seconds: 2)),
              Navigator.push(
                context,
                NavigatorClass.animatedRoute(
                  route: const UserLoginScreen(),
                ),
              ),
              clearTextField(),
              log("Success"),
            })
        .onError((error, stackTrace) => {
              setLoading(false),
              log("failed"),
              SnackBarWidget.snackBar(context, error.toString()),
            });
    setLoading(false);
  }

  Map<String, dynamic> newPassBody() {
    Map<String, dynamic> body = {
      "mobile": phoneController.text.trim(),
      "pwd": newpasswordController.text.trim(),
    };

    return body;
  }

  setLoadingOtp(bool loading) {
    _isLoadingOtp = loading;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  clearTextField() {
    newpasswordController.clear();
    newConfpasswordController.clear();
    phoneController.clear();
  }

  // errorResonses(int? statusCode, Object? message, BuildContext context) {
  //   if (statusCode == 404) {
  //     return SnackBarWidget.snackBar(
  //         context, "Could not find the mobile number");
  //   }
  //   return SnackBarWidget.snackBar(context, message.toString());
  // }
}
