import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/view_model/forget_password_view_model.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/user_registration/view_model/sign_up_view_model.dart';
import 'pass_visible_button.dart';
import '../../utils/textfield_validator.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData textFieldIcon;
  final TextInputType keyType;
  final bool isPassword;
  final bool isForgetPass;
  final bool isConfPass;
  final bool isLoginPass;
  final bool isLoginPhone;
  final bool isPhone;
  final bool isUser;

  const TextFormWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.textFieldIcon,
    required this.keyType,
    this.isPassword = false,
    this.isForgetPass = false,
    this.isConfPass = false,
    this.isLoginPass = false,
    this.isLoginPhone = false,
    this.isPhone = false,
    this.isUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final watchSignUpprovider = context.watch<SignUpViewModel>();
    final isShowPassword = watchSignUpprovider.isShowPassword;
    final passController = isForgetPass
        ? context.watch<ForgetPassViewModel>().newpasswordController
        : watchSignUpprovider.passController;
    final confpassController = watchSignUpprovider.confirfPassController;
    final isShowConfPassword = watchSignUpprovider.isShowConfPassword;
    final userLoginViewModel = context.watch<UserLoginViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onChanged: (value) {
          context.read<SignUpViewModel>().checkTextFieldisEmpty();
        },
        minLines: 1,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
          isPhone || isLoginPhone
              ? LengthLimitingTextInputFormatter(10)
              : LengthLimitingTextInputFormatter(20),
        ],
        controller: controller,
        obscureText: isPassword
            ? isShowPassword
            : isConfPass
                ? isShowConfPassword
                : isLoginPass
                    ? userLoginViewModel.isShowPassword
                    : false,
        keyboardType: keyType,
        validator: (value) {
          return Validator.textFieldValidator(
            value: value,
            isUser: isUser,
            isPhone: isPhone,
            isLoginPhone: isLoginPhone,
            isPassword: isPassword,
            isConfPass: isConfPass,
            isLoginPass: isLoginPass,
            passController: passController.text,
          );
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIconColor: MyColors.black,
          prefixIcon:
              //  isPhone
              //     ? Padding(
              //         padding: const EdgeInsets.only(bottom: 2.3),
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Image.asset("assets/india_flag.png",
              //                 width: 50, height: 20),
              //             Text("+91", style: loginTextStyle)
              //           ],
              //         ),
              //       )
              //     :
              Icon(textFieldIcon, size: 25),
          suffixIconColor: MyColors.black,
          suffixIcon: isPassword && passController.text.isNotEmpty
              ? Consumer<SignUpViewModel>(
                  builder: (context, signUpViewModel, child) {
                  return PassVisibleButton(
                    isShowPassword: signUpViewModel.isShowPassword,
                    onTap: () {
                      signUpViewModel.setshowPassword();
                    },
                  );
                })
              : isConfPass && confpassController.text.isNotEmpty
                  ? Consumer<SignUpViewModel>(
                      builder: (context, signUpViewModel, child) {
                      return PassVisibleButton(
                        isShowPassword: signUpViewModel.isShowConfPassword,
                        onTap: () {
                          signUpViewModel.setshowConfPassword();
                        },
                      );
                    })
                  : isLoginPass &&
                          userLoginViewModel
                              .loginPasswordCntrllr.text.isNotEmpty
                      ? Consumer<UserLoginViewModel>(
                          builder: (context, userLoginViewModel, child) {
                          return PassVisibleButton(
                            isShowPassword: userLoginViewModel.isShowPassword,
                            onTap: () {
                              userLoginViewModel.setShowPassword();
                            },
                          );
                        })
                      : MySize.kHeight10,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: MyColors.black,
          ),
        ),
      ),
    );
  }
}
