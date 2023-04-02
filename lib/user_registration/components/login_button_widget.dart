import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: MyColors.kGreyColor,
        elevation: 0,
        backgroundColor: MyColors.kButtonColor,
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
