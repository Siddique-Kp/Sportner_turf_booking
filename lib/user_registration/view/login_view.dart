import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/user_registration/components/login_button_widget.dart';
import 'package:sporter_turf_booking/user_registration/components/registering_text_widget.dart';
import 'package:sporter_turf_booking/user_registration/components/text_form_field.dart';
import 'package:sporter_turf_booking/user_registration/view/sign_up_view.dart';
import 'package:sporter_turf_booking/user_registration/view_model/user_login_view_model.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/textstyles.dart';
import '../view_model/firebase_auth_view_model.dart';

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
    final firebaseAuthViewModel = context.read<FirebaseAuthViewModel>();
    final size = MediaQuery.of(context).size;
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
                    AppSizes.kHeight20,
                    Text("Welcome Back", style: AppTextStyles.loginHeading),
                    const Text(
                      "Sign to continue",
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    AppSizes.kHeight10,
                    SizedBox(
                      height: size.height * 0.2,
                      width: size.width * 0.5,
                      child: SvgPicture.asset(
                        "assets/login_pic.svg",
                        fit: BoxFit.contain,
                        // ignore: deprecated_member_use
                        color: Colors.green,
                      ),
                    ),
                    AppSizes.kHeight10,
                    Consumer<UserLoginViewModel>(
                      builder: (context, userLoginViewModel, child) {
                        return TextFormWidget(
                          isLoginPhone: true,
                          controller: userLoginViewModel.loginPhoneCntrllr,
                          labelText: 'Phone',
                          textFieldIcon: Icons.phone_iphone,
                          keyType: TextInputType.number,
                        );
                      },
                    ),
                    Consumer<UserLoginViewModel>(
                        builder: (context, userLoginViewModel, child) {
                      return TextFormWidget(
                        isLoginPass: true,
                        controller: userLoginViewModel.loginPasswordCntrllr,
                        labelText: 'Password',
                        textFieldIcon: Icons.lock_outline,
                        keyType: TextInputType.text,
                      );
                    }),
                    AppSizes.kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, NavigatorClass.forgetPassScreen);
                          },
                          child: const Text(
                            "Forgot Password?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kButtonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSizes.kHeight30,
                    LoginButtonWidget(
                      isLogin: true,
                      onPressed: () async {
                        if (loginKey.currentState!.validate()) {
                          await context
                              .read<UserLoginViewModel>()
                              .getLoginStatus(context);
                        }
                      },
                      title: "LOGIN",
                    ),
                    AppSizes.kHeight20,
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
                    AppSizes.kHeight10,
                    InkWell(
                      onTap: () async {
                        await firebaseAuthViewModel.firebaseGoogleAuth(context);
                      },
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
                            AppSizes.kWidth20,
                            const Text(
                              "Continue with google",
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 18,
                              ),
                            ),
                            AppSizes.kWidth30,
                          ],
                        ),
                      ),
                    ),
                    AppSizes.kHeight30,
                    RegisteringText(
                      onTap: () {
                        // Navigator.pushNamed(
                        //     context, NavigatorClass.signUpScreen);
                        Get.to(() => const UserSignUpScreen(),
                            transition: Transition.topLevel,
                            duration: const Duration(seconds: 2));
                        context.read<UserLoginViewModel>().clearController();
                      },
                      leftText: "Don't have account? ",
                      rightText: "Register",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
