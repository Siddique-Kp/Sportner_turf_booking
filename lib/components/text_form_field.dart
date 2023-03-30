import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/consts/textstyles.dart';

TextEditingController _passController = TextEditingController();
TextEditingController get passController => _passController;

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData textFieldIcon;
  final TextInputType keyType;
  final bool isPassword;
  final bool isConfPass;
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
    this.isPhone = false,
    this.isUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
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
            } else if (value != _passController.text) {
              return "Password must match";
            }
          }
          return null;
        },
        decoration: InputDecoration(
            
            // filled: true,
            // fillColor: Colors.grey[100],
            
            border:OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: isPhone
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 2.3),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/india_flag.png",
                            width: 50, height: 20),
                        Text("+91", style: loginTextStyle)
                      ],
                    ),
                )
                : Icon(textFieldIcon,size: 27,),
            labelText: labelText),
      ),
    );
  }
}
