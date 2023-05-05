import 'package:flutter/material.dart';
import '../../../utils/global_values.dart';
import '../../../utils/textstyles.dart';
import '../../model/venue_data_model.dart';

class PaymentDetailsContainer extends StatelessWidget {
  const PaymentDetailsContainer({
    super.key,
    required this.venueData,
  });

  final VenueDataModel venueData;

  @override
  Widget build(BuildContext context) {
    final discountPrice =
        ((venueData.discountPercentage! / 100) * venueData.actualPrice!)
            .toInt();
    final payableAmount = venueData.actualPrice! - discountPrice;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Court Price :", style: AppTextStyles.textH4),
            AppSizes.kHeight5,
            Text("Offer Discount :", style: AppTextStyles.textH4),
            AppSizes.kHeight5,
            Text("Payable Amount :", style: AppTextStyles.textH4),
            AppSizes.kHeight5,
            AppSizes.kHeight20,
            Text("Total Amount :", style: AppTextStyles.textH1),
          ],
        ),
        SizedBox(
          width: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("₹ ${venueData.actualPrice}", style: AppTextStyles.textH4),
              AppSizes.kHeight5,
              Text("₹ $discountPrice", style: AppTextStyles.textH4),
              AppSizes.kHeight5,
              Text("₹ $payableAmount", style: AppTextStyles.textH4),
              AppSizes.kHeight20,
              Text("₹ $payableAmount", style: AppTextStyles.textH1),
            ],
          ),
        ),
      ],
    );
  }
}
