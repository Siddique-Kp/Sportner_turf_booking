import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import '../../repo/api_status.dart';
import '../components/snackbar.dart';

class ForgetPassViewModel with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController newConfpasswordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  getForgetPassStatus(BuildContext context) async {
    setLoading(true);

    final response = await ApiServices.getMethod(
        url: Urls.kFORGOTPASSmob + phoneController.text);

    if (response is Success) {
      log("Success");
      context
          .read<FirebaseAuthViewModel>()
          .fireBasePhoneAuth(context, phoneController.text, true);
    }
    if (response is Failure) {
      log("Failed");
      errorResonses(response.code, response.errorResponse, context);

      setLoading(false);
    }
    setLoading(false);
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
      return SnackBarWidget.snackBar(context, "Could not find the mobile number");
    }
    return SnackBarWidget.snackBar(context, message.toString());
  }
}
