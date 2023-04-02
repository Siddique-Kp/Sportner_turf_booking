import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/user_registration/view_model/sign_up_view_model.dart';
import 'pass_visible_button.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData textFieldIcon;
  final TextInputType keyType;
  final bool isPassword;
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
    this.isConfPass = false,
    this.isLoginPass = false,
    this.isLoginPhone = false,
    this.isPhone = false,
    this.isUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final watchSignUpprovider = context.watch<SignUpViewModel>();
    final readSignUpprovider = context.read<SignUpViewModel>();
    final isShowPassword = watchSignUpprovider.isShowPassword;
    final passController = watchSignUpprovider.passController;
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
          if (isUser) {
            if (value == null || value.isEmpty) {
              return "Username is required";
            }
          }
          if (isPhone) {
            if (value == null || value.isEmpty) {
              return "Mobile number is required";
            } else if (value.length != 10) {
              return "Enter valid mobile number";
            }
          }
          if (isLoginPhone) {
            if (value == null || value.isEmpty) {
              return "Enter the mobile number";
            } else if (value.length != 10) {
              return "Enter valid mobile number";
            }
          }
          if (isPassword) {
            RegExp isUppercase = RegExp(r'^(?=.*?[A-Z])');
            RegExp islowercase = RegExp(r'^(?=.*?[a-z])');
            RegExp isOnenumber = RegExp(r'^(?=.*?[0-9])');
            RegExp isSpecial = RegExp(r'^(?=.*?[!@#\$&*~])');
            RegExp islength8 = RegExp(r'^.{8,}');
            if (value == null || value.isEmpty) {
              return "Password is required";
            } else if (!islength8.hasMatch(value)) {
              return "Password must be 8 or more characters";
            } else if (!isUppercase.hasMatch(value)) {
              return "Password must contain atleast one\nUppercase";
            } else if (!islowercase.hasMatch(value)) {
              return "Password must contain atleast one\nlowercase";
            } else if (!isOnenumber.hasMatch(value)) {
              return "Password must contain atleast\none number";
            } else if (!isSpecial.hasMatch(value)) {
              return "Should contain atleast one\nspecial character eg.(!@#\$&*~)";
            }
          }

          if (isConfPass) {
            if (value == null || value.isEmpty) {
              return "Enter the Confirm password";
            } else if (value != passController.text) {
              return "Password must match";
            }
          }
          if (isLoginPass) {
            if (value == null || value.isEmpty) {
              return "Enter the password";
            } else {
              return null;
            }
          }

          return null;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIconColor: MyColors.klightBlackColor,
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
          suffixIconColor: MyColors.klightBlackColor,
          suffixIcon: isPassword && passController.text.isNotEmpty
              ? PassVisibleButton(
                  isShowPassword: isShowPassword,
                  onTap: () {
                    readSignUpprovider.setshowPassword();
                  },
                )
              : isConfPass && confpassController.text.isNotEmpty
                  ? PassVisibleButton(
                      isShowPassword: isShowConfPassword,
                      onTap: () {
                        readSignUpprovider.setshowConfPassword();
                      },
                    )
                  : isLoginPass &&
                          userLoginViewModel
                              .loginPasswordCntrllr.text.isNotEmpty
                      ? PassVisibleButton(
                          isShowPassword: userLoginViewModel.isShowPassword,
                          onTap: () {
                            context
                                .read<UserLoginViewModel>()
                                .setShowPassword();
                          },
                        )
                      : MySize.kHeight10,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: MyColors.klightBlackColor,
          ),
        ),
      ),
    );
  }
}
