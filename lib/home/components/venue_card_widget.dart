import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_details_view_model.dart';
import 'package:sporter_turf_booking/home/view_model/venue_list_view_model.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import 'home_components/home_components.dart';
import 'sports_icon.dart';

class VenueCardWidget extends StatelessWidget {
  final bool isOffer;
  final int index;
  const VenueCardWidget({
    super.key,
    this.isOffer = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final venueDataList = context.watch<VenueListViewModel>().venuDataList;
    final venueData = venueDataList[index];
    return InkWell(
      onTap: () async {
        await context
            .read<VenueDetailsViewModel>()
            .getSingleVenue(venueData.sId!);
        await Navigator.pushNamed(context, NavigatorClass.venueDetailsScreen);
      },
      child: SizedBox(
        height: 50,
        width: 150,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageContainer(venueData),
              AppSizes.kHeight10,
              _venueDetails(venueData, venueDataList)
            ],
          ),
        ),
      ),
    );
  }

  Padding _venueDetails(
      VenueDataModel venueData, List<VenueDataModel> venueDataList) {
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
          const Text(
            "1.2 KM away",
            style: TextStyle(
              fontSize: 11,
              color: MyColors.grey
            ),
          ),
          AppSizes.kHeight5,
          SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: venueData.sportFacility!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Sports.spots(
                  sport: venueData.sportFacility![index].sport.toString(),
                );
              },
            ),
          ),
          AppSizes.kHeight5,
          isOffer
              ? _offerWidget(venueDataList)
              : const RatingStarWidget(value: 3)
        ],
      ),
    );
  }

  Row _offerWidget(List<VenueDataModel> venueDataList) {
    return Row(
      children: [
        const CircleAvatar(
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
          "${venueDataList[index].discountPercentage}% OFF",
          style: const TextStyle(
            color: MyColors.kOfferColor,
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
        image: DecorationImage(
          image: NetworkImage(venueData.image!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
