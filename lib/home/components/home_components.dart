import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';

class RatingStarWidget extends StatelessWidget {
  final int value;
  const RatingStarWidget({super.key, this.value = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          return index < value
              ? const Icon(Icons.star, color: Colors.amber, size: 17)
              : const Icon(Icons.star, color: MyColors.kGreyColor, size: 17);
        },
      ),
    );
  }
}
