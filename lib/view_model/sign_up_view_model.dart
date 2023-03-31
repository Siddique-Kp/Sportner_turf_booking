import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';

class SignUpViewModel with ChangeNotifier {
  bool _isShowPassword = true;
  bool _isShowConfPassword = true;
  String otpValue = '';
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();
  Color _elevatedButtonColor = kButtonColor.withOpacity(0.5);
  bool get isShowPassword => _isShowPassword;
  bool get isShowConfPassword => _isShowConfPassword;
  Color get elevatedButtonColor => _elevatedButtonColor;

  showUnshowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }

  showUnshowConfPassword() {
    _isShowConfPassword = !_isShowConfPassword;
    notifyListeners();
  }

  checkTextFieldisEmpty() {
    if (userNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passController.text.isEmpty ||
        confirfPassController.text.isEmpty) {
      log('hiiiiiiiii');
      _elevatedButtonColor = Colors.green.withOpacity(0.5);
    } else {
      log('000000000000000');
      _elevatedButtonColor = kButtonColor;
    }
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
}
