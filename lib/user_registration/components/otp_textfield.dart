import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/user_registration/view_model/sign_up_view_model.dart';

class OtpTextfieldWidget extends StatelessWidget {
  const OtpTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      fieldWidth: 45,
      borderColor: MyColors.kButtonColor,
      focusedBorderColor:  MyColors.kButtonColor,
      cursorColor:  MyColors.klightBlackColor,
      onCodeChanged: (String code) {
        Provider.of<SignUpViewModel>(context, listen: false)
            .getOtp(code);

      },

      onSubmit: (String verificationCode) {
        Provider.of<SignUpViewModel>(context, listen: false)
            .getOtp(verificationCode);
      },
    );
  }
}
