import 'package:flutter/material.dart';

class SignUpViewModel with ChangeNotifier {
  bool _isShowPassword = true;
  bool _isShowConfPassword = true;
  String otpValue = '';
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();
  bool get isShowPassword => _isShowPassword;
  bool get isShowConfPassword => _isShowConfPassword;

  showUnshowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  showUnshowConfPassword() {
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
    notifyListeners();
  }

  getOtp(String verificationCode) {
    otpValue = verificationCode;
    notifyListeners();
  }

  clearOTP() {
    otpValue = '';
    notifyListeners();
  }
}
