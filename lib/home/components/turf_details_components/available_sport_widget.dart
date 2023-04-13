import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';

class AvailableSportsWidget extends StatelessWidget {
  const AvailableSportsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => MySize.kWidth10,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 70.0,
            child: Column(
              children: const [
                Icon(Icons.sports_soccer),
                MySize.kHeight10,
                Text(
                  "Football",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: MyColors.black,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}