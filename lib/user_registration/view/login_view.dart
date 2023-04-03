import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/components/login_button_widget.dart';
import 'package:sporter_turf_booking/user_registration/components/registering_text_widget.dart';
import 'package:sporter_turf_booking/user_registration/components/text_form_field.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/textstyles.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  late final GlobalKey<FormState> loginKey;
  @override
  void initState() {
    loginKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userLoginViewModel = context.watch<UserLoginViewModel>();
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
                  MySize.kHeight20,
                  Text("Welcome Back", style: MyTextStyles.loginHeadingStyle),
                  const Text(
                    "Sign to continue",
                    style: TextStyle(
                      color: MyColors.kGreyColor,
                    ),
                  ),
                  MySize.kHeight10,
                  SvgPicture.asset(
                    "assets/login_pic.svg",
                    // ignore: deprecated_member_use
                    color: Colors.green,
                  ),
                  MySize.kHeight20,
                  TextFormWidget(
                    isLoginPhone: true,
                    controller: userLoginViewModel.loginPhoneCntrllr,
                    labelText: 'Phone',
                    textFieldIcon: Icons.phone_iphone,
                    keyType: TextInputType.number,
                  ),
                  TextFormWidget(
                    isLoginPass: true,
                    controller: userLoginViewModel.loginPasswordCntrllr,
                    labelText: 'Password',
                    textFieldIcon: Icons.lock_outline,
                    keyType: TextInputType.text,
                  ),
                  MySize.kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: MyColors.kButtonColor,
                        ),
                      ),
                    ],
                  ),
                  MySize.kHeight30,
                  LoginButtonWidget(
                    isLogin: true,
                    onPressed: () async {
                      if (loginKey.currentState!.validate()) {
                        await context
                            .read<UserLoginViewModel>()
                            .getLoginStatus(context);

                        // if (userLoginViewModel.loginError.code == 401) {
                        //   log("incorrect username");
                        // } else {
                        //   log("kkkkkkkkkkk");
                        // }
                      }
                    },
                    title: "LOGIN",
                  ),
                  MySize.kHeight20,
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
                  MySize.kHeight10,
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
                          MySize.kWidth20,
                          const Text(
                            "Continue with google",
                            style: TextStyle(
                              color: MyColors.kGreyColor,
                              fontSize: 18,
                            ),
                          ),
                          MySize.kWidth30,
                        ],
                      ),
                    ),
                  ),
                  MySize.kHeight30,
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
