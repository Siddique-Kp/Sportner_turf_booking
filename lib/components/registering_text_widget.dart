import 'package:flutter/material.dart';

import '../consts/global_colors.dart';

class RegisteringText extends StatelessWidget {
  const RegisteringText({
    super.key,
    required this.onTap,
    required this.leftText,
    required this.rightText,
  });

  final GestureTapCallback? onTap;
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: klightBlackColor
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            rightText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: kButtonColor,
            ),
          ),
        )
      ],
    );
  }
}
