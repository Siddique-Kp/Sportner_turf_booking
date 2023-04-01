import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sporter_turf_booking/components/login_button_widget.dart';
import 'package:sporter_turf_booking/components/registering_text_widget.dart';
import 'package:sporter_turf_booking/components/text_form_field.dart';
import '../consts/global_colors.dart';
import '../consts/global_values.dart';
import '../consts/textstyles.dart';

TextEditingController loginPhoneController = TextEditingController();
TextEditingController loginPassController = TextEditingController();

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
final loginKey = GlobalKey<FormState>();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight20,
                  Text("Welcome Back", style: loginHeadingStyle),
                  Text(
                    "Sign to continue",
                    style: TextStyle(
                      color: kGreyColor,
                    ),
                  ),
                  kHeight10,
                  SvgPicture.asset(
                    "assets/login_pic.svg",
                    // ignore: deprecated_member_use
                    color: Colors.green,
                  ),
                  kHeight20,
                  TextFormWidget(
                    isLoginPhone: true,
                    controller: loginPhoneController,
                    labelText: 'Phone',
                    textFieldIcon: Icons.phone_iphone,
                    keyType: TextInputType.number,
                  ),
                  TextFormWidget(
                    isLoginPass: true,
                    controller: loginPassController,
                    labelText: 'Password',
                    textFieldIcon: Icons.lock_outline,
                    keyType: TextInputType.text,
                  ),
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: kButtonColor,
                        ),
                      ),
                    ],
                  ),
                  kHeight30,
                  LoginButtonWidget(
                    isLogin: true,
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/otpRegister");
                      }
                    },
                    title: "LOGIN",
                  ),
                  kHeight20,
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(thickness: 1.5),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text("OR"),
                      ),
                      Expanded(
                        child: Divider(thickness: 1.5),
                      ),
                    ],
                  ),
                  kHeight10,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/google-logo.png"),
                          ),
                          kWidth20,
                          Text(
                            "Continue with google",
                            style: TextStyle(
                              color: kGreyColor,
                              fontSize: 18,
                            ),
                          ),
                          kWidth30,
                        ],
                      ),
                    ),
                  ),
                  kHeight30,
                  RegisteringText(
                    onTap: () {
                      Navigator.pushNamed(context, "/userSignUp");
                    },
                    leftText: "Don't have account? ",
                    rightText: "Register",
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
