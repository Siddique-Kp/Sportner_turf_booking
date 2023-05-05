import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../../../utils/textstyles.dart';

class BookingPolicyWidget extends StatelessWidget {
  const BookingPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:
          Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedIconColor: AppColors.black,
        title: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Booking Policies",
                style: AppTextStyles.textH3,
              ),
              const Divider(
                thickness: 1.5,
                color: Colors.black,
              )
            ],
          ),
        ),
        tilePadding: const EdgeInsets.all(0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Resceduling policy",
                style: AppTextStyles.textH3,
              ),
              AppSizes.kHeight5,
              const Text(
                  '''Rescheduling is allowed 2 Hours prior to slot time. Rescheduling of a booking can be done only 2 times. Once rescheduled, booking cannot be cancelled.'''),
            ],
          ),
          AppSizes.kHeight10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cancel policy",
                style: AppTextStyles.textH3,
              ),
              AppSizes.kHeight5,
              const Text(
                  '''0-2 hrs prior to slot: Cancellations not allowed.>2 hrs prior to slot: 15.0% of Gross Amount will be deducted as cancellation fee.'''),
            ],
          ),
        ],
      ),
    );
  }
}