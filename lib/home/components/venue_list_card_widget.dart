import 'package:flutter/material.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';
import 'home_components.dart';

class VenueListCardWidget extends StatelessWidget {
  const VenueListCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Row(
          children: [
            _imageContianer(),
            MySize.kWidth10,
            _turfDetailsContainer(size)
          ],
        ),
        const Spacer(),
        _turfPriceContainer()
      ],
    );
  }

  Column _turfPriceContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "Starting from",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: MyColors.grey),
            ),
            Text(
              "₹ 1000",
              style: TextStyle(
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

  Column _turfDetailsContainer(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.30,
          child: const Text(
            "Hennur turf park",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w700),
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

  Container _imageContianer() {
    return Container(
      height: 80,
      width: 80,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/turf_1.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
