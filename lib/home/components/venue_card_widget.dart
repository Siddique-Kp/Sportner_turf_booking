import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sporter_turf_booking/home/view/turf_details_view.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import 'home_components/home_components.dart';

class VenueCardWidget extends StatelessWidget {
  final bool isOffer;
  const VenueCardWidget({
    super.key,
    this.isOffer = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const TurfDetailsView());
      },
      child: SizedBox(
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/turf_image.png",
                  fit: BoxFit.cover,
                ),
              ),
              AppSizes.kHeight10,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "The Java Stadium ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      "1.2 KM away",
                      style: TextStyle(
                        fontSize: 11,
                        color: MyColors.grey,
                      ),
                    ),
                    AppSizes.kHeight5,
                    Row(
                      children: const [
                        Icon(
                          Icons.sports_soccer_rounded,
                          size: 19,
                        ),
                        Icon(
                          Icons.sports_cricket_rounded,
                          size: 22,
                        ),
                      ],
                    ),
                    AppSizes.kHeight5,
                    isOffer
                        ? Row(
                            children: const [
                              CircleAvatar(
                                backgroundColor: MyColors.kOfferColor,
                                radius: 10,
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                    color: MyColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              AppSizes.kWidth5,
                              Text(
                                "20% OFF",
                                style: TextStyle(
                                  color: MyColors.kOfferColor,
                                ),
                              )
                            ],
                          )
                        : const RatingStarWidget(value: 3)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
