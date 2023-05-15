import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/venue_list_view_model.dart';
import 'home_components.dart';
import '../venue_card_widget.dart';

class TurfWithOfferWidget extends StatelessWidget {
  const TurfWithOfferWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final venueViewModel = context.watch<VenueListViewModel>();

    return Column(children: [
      HomeComponents.viewAllText(
        lText: "Turf with offers",
        onPressed: () {},
      ),
      SizedBox(
        width: size.width,
        height: size.height * 0.25,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: venueViewModel.offeredVenues.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: VenueCardWidget(
                      isOffer: true,
                      venueData:venueViewModel.offeredVenues[index] ,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
