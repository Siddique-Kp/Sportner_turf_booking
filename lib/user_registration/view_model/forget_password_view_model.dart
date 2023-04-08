import 'package:flutter/material.dart';

class ForgetPassViewModel with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final _forgetKey = GlobalKey<FormState>();

  // GlobalKey get forgetKey => _forgetKey;


  clearTextField() {
    passwordController.clear();
    phoneController.clear();
  }
}
