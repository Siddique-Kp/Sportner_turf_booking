import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/components/text_form_field.dart';
import 'package:sporter_turf_booking/user_registration/view_model/firebase_auth_view_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/forget_password_view_model.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/textstyles.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final _forgetKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgetPassViewModel = context.watch<ForgetPassViewModel>();
    final firebaseauthViewModel = context.watch<FirebaseAuthViewModel>();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                MySize.kHeight50,
                Text(
                  "Forgot Password ?",
                  style: MyTextStyles.loginHeadingStyle,
                ),
                MySize.kHeight10,
                const Text(
                  "Enter the registered mobile number here.",
                  style: TextStyle(
                    color: MyColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MySize.kHeight30,
                Form(
                  key: _forgetKey,
                  child: TextFormWidget(
                    controller: forgetPassViewModel.phoneController,
                    labelText: "Phone",
                    textFieldIcon: Icons.phone_iphone_rounded,
                    keyType: TextInputType.phone,
                    isLoginPhone: true,
                  ),
                ),
                MySize.kHeight30,
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: forgetPassViewModel.phoneController.text.isEmpty
                        ? null
                        : () {
                            if (_forgetKey.currentState!.validate()) {
                              context
                                  .read<ForgetPassViewModel>()
                                  .getForgetPassStatus(context);
                            }
                          },
                    style: ElevatedButton.styleFrom(elevation: 0),
                    child: forgetPassViewModel.isLoadingotp || firebaseauthViewModel.isLoadingOtp
                        ? const CircularProgressIndicator(
                          color: MyColors.white,
                          strokeWidth: 3,
                        )
                        : const Text("Send OTP"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
