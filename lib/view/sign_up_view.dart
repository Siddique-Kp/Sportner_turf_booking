import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';
import 'package:sporter_turf_booking/consts/global_values.dart';
import 'package:sporter_turf_booking/consts/textstyles.dart';
import 'package:sporter_turf_booking/view/otp_page_view.dart';
import 'package:sporter_turf_booking/view_model/sign_up_view_model.dart';
import '../components/login_button_widget.dart';
import '../components/registering_text_widget.dart';
import '../components/text_form_field.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController countryCode = TextEditingController();

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = context.watch<SignUpViewModel>();
    TextEditingController userNameController =
        signUpProvider.userNameController;
    TextEditingController phoneController = signUpProvider.phoneController;
    TextEditingController passController = signUpProvider.passController;
    TextEditingController confirfPassController =
        signUpProvider.confirfPassController;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/login_top.svg"),
          GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        kHeight50,
                        Text("Create Account", style: loginHeadingStyle),
                        Text(
                          "Create new account",
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
                          textFieldIcon: Icons.phone_iphone,
                          keyType: TextInputType.number,
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
                        LoginButtonWidget(
                          title: "CREATE ACCOUNT",
                          onPressed: userNameController.text.isEmpty ||
                                  phoneController.text.isEmpty ||
                                  passController.text.isEmpty ||
                                  confirfPassController.text.isEmpty
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                      phoneNumber: countryCode.text +
                                          phoneController.text,
                                      verificationCompleted:
                                          (PhoneAuthCredential credential) {},
                                      verificationFailed:
                                          (FirebaseAuthException e) {
                                            
                                          },
                                      codeSent: (String verificationId,
                                          int? resendToken) {
                                        OtpVerificationPage.verify =
                                            verificationId;
                                        Navigator.pushNamed(
                                            context, "/otpRegister");
                                      },
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {},
                                    );
                                  }
                                },
                        ),
                        kHeight30,
                        RegisteringText(
                          leftText: 'Already have an account? ',
                          rightText: "Login",
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/userLogin");
                            Provider.of<SignUpViewModel>(context, listen: false)
                                .clearTextField();
                            Provider.of<SignUpViewModel>(context, listen: false)
                                .checkTextFieldisEmpty();
                          },
                        )
                      ],
                    ),
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
