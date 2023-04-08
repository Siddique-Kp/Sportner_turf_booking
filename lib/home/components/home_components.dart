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

class HomeComponents {
  static Widget viewAllText({
    required String lText,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            style: const ButtonStyle(
              visualDensity: VisualDensity.compact,
            ),
            child: const Text("View all"),
          ),
        ],
      ),
    );
  }
}
