import 'package:flutter/material.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';
import '../sport_name_card.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppSizes.kHeight20,
              Text(
                "Hello Siddique",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              AppSizes.kHeight10,
              Text(
                "Find your arena",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        AppSizes.kHeight20,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Wrap(
              direction: Axis.horizontal,
              children: SportNameCard.sportItemsdata(context),
            ),
          ),
        ),
      ],
    );
  }
}