import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../model/venue_data_model.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.venueData,
  });

  final VenueDataModel venueData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: MyColors.black,
          ),
        ),
        AppSizes.kHeight10,
        Text(venueData.description!)
      ],
    );
  }
}