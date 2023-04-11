import 'package:flutter/material.dart';

import 'home_components.dart';
import 'venue_card_widget.dart';

class TurfWithOfferWidget extends StatelessWidget {
  const TurfWithOfferWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(children: [
      HomeComponents.viewAllText(
        lText: "Turf with offers",
        onPressed: () {},
      ),
      SizedBox(
        width: size.width,
        height: 190,
        child: Row(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 165,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: VenueCardWidget(
                      isOffer: true,
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
