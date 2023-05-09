import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import '../view_model/get_location_view_model.dart';
import 'sports_icon.dart';

class VenueCardWidget extends StatelessWidget {
  final bool isOffer;
  final VenueDataModel venueDataList;
  const VenueCardWidget({
    super.key,
    this.isOffer = false,
    required this.venueDataList,
  });

  @override
  Widget build(BuildContext context) {
    final locationViewModel = context.watch<GetLocationViewModel>();
    final venueData = venueDataList;
    if (locationViewModel.currentPosition != null) {
      context
          .watch<GetLocationViewModel>()
          .getDistance(venueData.lat!, venueData.lng!);
    }

    return InkWell(
      onTap: () async {
        await context
            .read<VenueDetailsViewModel>()
            .getSingleVenue(venueData.sId!);
        await Navigator.pushNamed(context, NavigatorClass.venueDetailsScreen);
      },
      child: SizedBox(
        width: 150,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageContainer(venueData),
              AppSizes.kHeight10,
              _venueDetails(venueData, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _venueDetails(
    VenueDataModel venueData,
    BuildContext context,
  ) {
    final distance = context.watch<GetLocationViewModel>().getDistanceInKm;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            venueData.venueName!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
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
          AppSizes.kHeight5,
          SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: venueData.sportFacility!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Icon(
                  Sports.spots(
                    sport: venueData.sportFacility![index].sport.toString(),
                  ),
                  size: 18,
                );
              },
            ),
          ),
          AppSizes.kHeight5,
          isOffer ? _offerWidget(venueData) : AppSizes.kWidth10
        ],
      ),
    );
  }

  Row _offerWidget(VenueDataModel venueData) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.kOfferColor,
          radius: 10,
          child: Text(
            "%",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        AppSizes.kWidth5,
        Text(
          "${venueData.discountPercentage}% OFF",
          style: const TextStyle(
            color: AppColors.kOfferColor,
          ),
        )
      ],
    );
  }

  Container _imageContainer(VenueDataModel venueData) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.lightGrey,
        image: DecorationImage(
          image: NetworkImage(venueData.image!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
