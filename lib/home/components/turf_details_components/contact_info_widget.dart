import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/global_colors.dart';
import '../../view_model/venue_details_view_model.dart';

class TurfDetailsContactInfo extends StatelessWidget {
  const TurfDetailsContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final venueData = context.watch<VenueDetailsViewModel>().venueData;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact us",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
            Text(
              "+91-${venueData.mobile}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color.fromARGB(255, 90, 89, 89),
              ),
            ),
          ],
        ),
        OutlinedButton(
            onPressed: () async{
             await launchUrl(Uri.parse("tel://+91${venueData.mobile}"));
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(const Size(40, 50)),
            ),
            child: const Icon(Icons.call)),
      ],
    );
  }
}
