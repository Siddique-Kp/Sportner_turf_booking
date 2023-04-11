import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';

class TurfDetailsContactInfo extends StatelessWidget {
  const TurfDetailsContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Contact us",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: MyColors.black,
              ),
            ),
            Text(
              "+918888876546",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color.fromARGB(255, 90, 89, 89),
              ),
            ),
          ],
        ),
        OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              minimumSize:
                  MaterialStateProperty.all(const Size(40, 50)),
            ),
            child: const Icon(Icons.call)),
      ],
    );
  }
}