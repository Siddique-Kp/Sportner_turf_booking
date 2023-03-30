import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';
import 'package:sporter_turf_booking/consts/global_values.dart';
import 'package:sporter_turf_booking/consts/registration_text.dart';
import 'package:sporter_turf_booking/consts/textstyles.dart';

import '../components/text_form_field.dart';

class UserSignUpScreen extends StatelessWidget {
  UserSignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirfPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/login_top.svg"),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      kHeight30,
                      Text("Create Account",
                          // textAlign: TextAlign.center,
                          style: loginHeadingStyle),
                      Text(
                        "Create new account",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kGreyColor,
                        ),
                      ),
                      kHeight50,
                      TextFormWidget(
                        isUser: true,
                        controller: userNameController,
                        labelText: 'Username',
                        textFieldIcon: Icons.person_outline,
                        keyType: TextInputType.text,
                      ),
                      TextFormWidget(
                        isPhone: true,
                        controller: phoneController,
                        labelText: 'Phone',
                        textFieldIcon: Icons.phone_android_outlined,
                        keyType: TextInputType.text,
                      ),
                      TextFormWidget(
                        isPassword: true,
                        controller: passController,
                        labelText: 'Password',
                        textFieldIcon: Icons.lock_outline,
                        keyType: TextInputType.text,
                      ),
                      TextFormWidget(
                        isConfPass: true,
                        controller: confirfPassController,
                        labelText: 'Confirm Password',
                        textFieldIcon: Icons.lock_outline,
                        keyType: TextInputType.text,
                      ),
                      kHeight40,
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("hiiiiiiiiiiii");
                          }
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              "CREATE ACCOUNT",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      kHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Already have an accound?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: buttonColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
