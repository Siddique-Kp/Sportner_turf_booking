import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/view_model/sign_up_view_model.dart';

import '../view/otp_page_view.dart';

class FirbaseAuthViewModel with ChangeNotifier {
  bool _isLoadingOtp = false;
  String otpValue = '';


  bool get isLoadingOtp => _isLoadingOtp;

  setOtpLoading(bool loadingOtp) {
    _isLoadingOtp = loadingOtp;
    notifyListeners();
  }

  fireBasePhoneAuth(BuildContext context) async {
    setOtpLoading(true);
    String countryCode = "+91";
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:
          countryCode + context.read<SignUpViewModel>().phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        setOtpLoading(false);
      },
      codeSent: (String verificationId, int? resendToken) {
        OtpVerificationPage.verify = verificationId;
        Navigator.pushNamed(context, "/otpRegister");
        setOtpLoading(false);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    notifyListeners();
  }

    setOtp(String verificationCode) {
    otpValue = verificationCode;
    notifyListeners();
  }

  clearOTP() {
    otpValue = '';
    notifyListeners();
  }
}
