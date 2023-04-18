import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/venue_list_view_model.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import 'home_components/home_components.dart';

class VenueListCardWidget extends StatelessWidget {
  const VenueListCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final venueDataList = context.watch<VenueListViewModel>().venuDataList;
    return Row(
      children: [
        Row(
          children: [
            _imageContianer(venueDataList[index]!.image!),
            AppSizes.kWidth10,
            _turfDetailsContainer(size,venueDataList[index]!.venueName!)
          ],
        ),
        const Spacer(),
        _turfPriceContainer(venueDataList[index]!.actualPrice!)
      ],
    );
  }

  Column _turfPriceContainer(int amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            const Text(
              "Starting from",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: MyColors.grey),
            ),
            Text(
              "₹ $amount",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: MyColors.black),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0),
              onPressed: () {},
              child: const Text("View"),
            ),
          ),
        )
      ],
    );
  }

  Column _turfDetailsContainer(Size size, String venueName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.30,
          child:  Text(
            venueName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          children: const [
            Icon(Icons.sports_soccer, size: 17),
            Icon(Icons.sports_cricket, size: 18),
          ],
        ),
        const RatingStarWidget(size: 13, value: 3),
        Row(
          children: const [
            Icon(Icons.location_on, size: 17),
            Text("Banglore"),
          ],
        )
      ],
    );
  }

  Container _imageContianer(String imageUrl) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
