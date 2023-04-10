import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/user_registration/view/login_view.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import '../../repo/api_status.dart';
import '../components/snackbar.dart';
import 'package:get/get.dart';

class ForgetPassViewModel with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController newConfpasswordController =
      TextEditingController();

  bool _isLoadingOtp = false;
  bool _isLoading = false;
  bool get isLoadingotp => _isLoadingOtp;
  bool get isLoading => _isLoading;

  getForgetPassStatus(BuildContext context) async {
    setLoadingOtp(true);
    final response = await ApiServices.getMethod(
        url: Urls.kFORGOTPASSmob + phoneController.text);
    if (response is Success) {
      log("Success");
      context
          .read<FirebaseAuthViewModel>()
          .fireBasePhoneAuth(context, phoneController.text, true);
      setLoadingOtp(false);
    }
    if (response is Failure) {
      log("Failed");
      errorResonses(response.code, response.errorResponse, context);

      setLoadingOtp(false);
    }
  }

  setNewPassword(context) async {
    setLoading(true);

    final response =
        await ApiServices.postMethod(Urls.kFORGOTPASS, newPassBody(), null);

    if (response is Success) {
      setLoading(false);

      Get.snackbar("Password changed successfully", "Please login again",
          icon: const Icon(
            Icons.info,
            color: MyColors.kButtonColor,
          ),
          snackPosition: SnackPosition.TOP);
      await Future.delayed(const Duration(seconds: 2));

      Get.to(() => const UserLoginScreen(),
          transition: Transition.circularReveal,
          duration: const Duration(milliseconds: 500));
      clearTextField();
      log("Success");
    }

    if (response is Failure) {
      log("Failed");
      setLoading(false);
      errorResonses(response.code, response.errorResponse, context);
    }
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

  errorResonses(int? statusCode, Object? message, BuildContext context) {
    if (statusCode == 404) {
      return SnackBarWidget.snackBar(
          context, "Could not find the mobile number");
    }
    return SnackBarWidget.snackBar(context, message.toString());
  }
}
