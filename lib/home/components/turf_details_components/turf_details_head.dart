import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../view_model/venue_details_view_model.dart';
import '../home_components/home_components.dart';

class TurfDetailsHeader extends StatelessWidget {
  const TurfDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(venueData.venueName!, style: AppTextStyles.textH1),
            AppSizes.kHeight5,
            Text("${venueData.place}, ${venueData.district}, kerala",
                style: AppTextStyles.textH5light),
            AppSizes.kHeight10,
            const RatingStarWidget(value: 3)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Icon(Icons.bookmark_outline),
            AppSizes.kHeight10,
            Text(
              "₹${venueData.actualPrice}",
              style: const TextStyle(
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
