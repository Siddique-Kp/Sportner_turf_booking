import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';

class SignUpViewModel with ChangeNotifier {
  bool _isShowPassword = true;
  bool _isShowConfPassword = true;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();
  Color _elevatedButtonColor = kButtonColor;
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
      _elevatedButtonColor = Colors.grey;
      notifyListeners();
    } else {
      _elevatedButtonColor = _elevatedButtonColor;
      notifyListeners();
    }
  }
}
