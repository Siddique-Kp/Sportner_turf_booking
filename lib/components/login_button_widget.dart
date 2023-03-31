import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/consts/global_colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLogin = false,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: kGreyColor,
        elevation: 0,
        backgroundColor: kButtonColor,
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
