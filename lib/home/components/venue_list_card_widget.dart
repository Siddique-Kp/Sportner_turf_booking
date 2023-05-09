import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/routes/navigations.dart';
import '../view_model/venue_details_view_model.dart';

class VenueListCardWidget extends StatelessWidget {
  const VenueListCardWidget({
    super.key,
    required this.venueName,
    required this.imageUrl,
    required this.sportFacilityLendth,
    required this.venuePrice,
    required this.district,
    required this.venueID,
    required this.sportIconWidget,
  });

  final String venueName;
  final String venueID;
  final String imageUrl;
  final int sportFacilityLendth;
  final String venuePrice;
  final String district;
  final Widget sportIconWidget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        await context.read<VenueDetailsViewModel>().getSingleVenue(venueID);
        Navigator.pushNamed(context, NavigatorClass.venueDetailsScreen);
      },
      child: Row(
        children: [
          Row(
            children: [
              _imageContianer(),
              AppSizes.kWidth10,
              _turfDetailsContainer(size)
            ],
          ),
          const Spacer(),
          _turfPriceContainer(context)
        ],
      ),
    );
  }

  Column _turfPriceContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Starting from",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.grey,
              ),
            ),
            Text(
              "₹ $venuePrice",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0),
              onPressed: () async {
                await context
                    .read<VenueDetailsViewModel>()
                    .getSingleVenue(venueID);
                Navigator.pushNamed(context, NavigatorClass.venueDetailsScreen);
              },
              child: const Text("View"),
            ),
          ),
        )
      ],
    );
  }

  Widget _turfDetailsContainer(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.30,
            child: Text(
              venueName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(child: sportIconWidget),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 17,
                color: AppColors.green,
              ),
              Text(
                district,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _imageContianer() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.lightGrey,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
