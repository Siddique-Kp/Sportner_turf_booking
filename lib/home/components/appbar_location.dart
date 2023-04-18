import 'package:flutter/material.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';


class AppBarLocation extends StatelessWidget {
  const AppBarLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on,
            color: MyColors.black
          ),
          AppSizes.kWidth10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Kozhikode",
                style: TextStyle(
                    color: MyColors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Kerala,India",
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      );
  }
}
