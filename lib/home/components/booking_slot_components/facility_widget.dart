import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';

class FacilityWidget extends StatelessWidget {
  const FacilityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          "Facility",
          style:AppTextStyles.mediumTexth2
        ),
        Row(
          children: [
            Radio(
              value: "0",
              groupValue: const Text("ddd"),
              onChanged: (value) {},
            ),
            const Text("5 v 5")
          ],
        ),
        Row(
          children: [
            Radio(
              value: "0",
              groupValue: const Text("ddd"),
              onChanged: (value) {},
            ),
            const Text("7 v 7")
          ],
        ),
        Row(
          children: [
            Radio(
              value: "0",
              groupValue: const Text("ddd"),
              onChanged: (value) {},
            ),
            const Text("11 v 11")
          ],
        ),
      ],
    );
  }
}