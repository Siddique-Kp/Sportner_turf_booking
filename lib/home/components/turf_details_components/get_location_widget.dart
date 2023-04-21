import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/home/view_model/get_location_view_model.dart';

class GetLocationWidget extends StatelessWidget {
  final VenueDataModel venueData;
  const GetLocationWidget({
    super.key,
    required this.venueData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {
          context
              .read<GetLocationViewModel>()
              .openMap(venueData.lat!, venueData.lng!);
        },
        icon: const Icon(
          Icons.location_on,
          size: 28,
        ),
        label: const Text(
          "Get location",
          style: TextStyle(fontSize: 19),
        ),
      ),
    );
  }
}
