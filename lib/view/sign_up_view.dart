import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';
import 'package:sporter_turf_booking/consts/global_values.dart';
import 'package:sporter_turf_booking/consts/textstyles.dart';
import 'package:sporter_turf_booking/view_model/sign_up_view_model.dart';
import '../components/text_form_field.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // final TextEditingController userNameController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController confirfPassController = TextEditingController();

  // @override
  // void dispose() {
  //   userNameController.dispose();
  //   phoneController.dispose();
  //   passController.dispose();
  //   confirfPassController.dispose();
  //   super.dispose();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController =
        context.watch<SignUpViewModel>().userNameController;
    final TextEditingController phoneController =
        context.watch<SignUpViewModel>().phoneController;
    final TextEditingController passController =
        context.watch<SignUpViewModel>().passController;
    final TextEditingController confirfPassController =
        context.watch<SignUpViewModel>().confirfPassController;
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // context.read<SignUpViewModel>().checkTextFieldisEmpty();

    // });
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
                          textFieldIcon: Icons.phone_android_outlined,
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context
                                .watch<SignUpViewModel>()
                                .elevatedButtonColor,
                          ),
                          onPressed:
                              //  userNameController.text.isEmpty ||
                              //         phoneController.text.isEmpty ||
                              //         passController.text.isEmpty ||
                              //         confirfPassController.text.isEmpty
                              //     ? null
                              //     : () {
                              //         if (_formKey.currentState!.validate()) {
                              //           print("hiiiiiiiiiiii");
                              //         }
                              //       },

                              () {
                            if (userNameController.text.isEmpty ||
                                phoneController.text.isEmpty ||
                                passController.text.isEmpty ||
                                confirfPassController.text.isEmpty) {
                              return;
                            }
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        kHeight30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushReplacementNamed(
                                //     context, "/userLogin");
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kButtonColor,
                                ),
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
          ),
        ],
      ),
    );
  }
}
