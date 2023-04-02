import 'package:flutter/material.dart';

class UserLoginViewModel with ChangeNotifier {
  TextEditingController loginPhoneCntrllr = TextEditingController();
  TextEditingController loginPasswordCntrllr = TextEditingController();

  bool _isShowPassword = false;

  bool get isShowPassword => _isShowPassword;

  setShowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }
}
