import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../home_components/home_components.dart';

class TurfDetailsHeader extends StatelessWidget {
  const TurfDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Liverpool soccer",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: MyColors.black),
            ),
            MySize.kHeight5,
            Text(
              "Near Hilite mall, calicut, kerala",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: MyColors.grey),
            ),
            MySize.kHeight10,
            RatingStarWidget(
              value: 3,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.bookmark_outline),
            MySize.kHeight10,
            Text(
              "₹1200",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: MyColors.black),
            )
          ],
        )
      ],
    );
  }
}