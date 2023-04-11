import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';

class AvailableSportsWidget extends StatelessWidget {
  const AvailableSportsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Sports",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: MyColors.black,
          ),
        ),
        MySize.kHeight20,
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => MySize.kWidth10,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 80.0,
                child: Column(
                  children: const [
                    Icon(Icons.sports_soccer),
                    MySize.kHeight5,
                    Text(
                      "Football",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: MyColors.black,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}