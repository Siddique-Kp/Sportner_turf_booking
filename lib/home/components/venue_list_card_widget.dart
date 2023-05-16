import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../../utils/routes/navigations.dart';
import '../view_model/get_location_view_model.dart';
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
    required this.latitude,
    required this.longitude,
    required this.sportIconWidget,
  });

  final String venueName;
  final String venueID;
  final String imageUrl;
  final int sportFacilityLendth;
  final String venuePrice;
  final String district;
  final double latitude;
  final double longitude;
  final Widget sportIconWidget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      final locationViewModel = context.watch<GetLocationViewModel>();
    if (locationViewModel.currentPosition != null) {
      context
          .watch<GetLocationViewModel>()
          .getDistance(latitude, longitude);
    }
    return InkWell(
      onTap: () async {
        final navigator = Navigator.of(context);
        await context.read<VenueDetailsViewModel>().getSingleVenue(venueID);
        navigator.pushNamed(NavigatorClass.venueDetailsScreen);
      },
      child: Row(
        children: [
          Row(
            children: [
              _imageContianer(),
              AppSizes.kWidth10,
              _turfDetailsContainer(size,context)
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
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 27,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0),
              onPressed: () async {
                final navigator = Navigator.of(context);
                await context
                    .read<VenueDetailsViewModel>()
                    .getSingleVenue(venueID);
                navigator.pushNamed(NavigatorClass.venueDetailsScreen);
              },
              child: const Text("View"),
            ),
          ),
        )
      ],
    );
  }

  Widget _turfDetailsContainer(Size size, BuildContext context) {
    final distance = context.watch<GetLocationViewModel>().getDistanceInKm;
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
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(child: sportIconWidget),
          distance != null
              ? Text(
                  "${distance.toStringAsFixed(1)} KM away",
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : AppSizes.kHeight5,
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 17,
                color: AppColors.blue,
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
