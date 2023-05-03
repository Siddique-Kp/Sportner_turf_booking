import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/bottom_nav_view_model.dart';

import '../../../utils/global_values.dart';
import '../../view_model/get_location_view_model.dart';
import '../../view_model/venue_list_view_model.dart';
import 'home_components.dart';
import '../venue_card_widget.dart';

class HomeNearestTurfWidget extends StatelessWidget {
  const HomeNearestTurfWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final venueDataList = context.watch<VenueListViewModel>().venuDataList;

    final size = MediaQuery.of(context).size;
    return Column(children: [
      HomeComponents.viewAllText(
        lText: "Nearest Turf",
        onPressed: () {
          context.read<BottomNavViewModel>().changeBottomNavindex(1); 
        },
      ),
      AppSizes.kHeight20,
      SizedBox(
        // width: size.width,
        height: size.height * 0.25,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:venueDataList.length ,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: VenueCardWidget(index: index),
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
