import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/venue_by_sport_view_model.dart';
import '../../utils/global_colors.dart';
import '../view/venue_by_sport_view.dart';

class SportsItems {
  final String sportName;
  final Widget sportIcon;
  final Color sportColor;

  SportsItems({
    required this.sportName,
    required this.sportIcon,
    required this.sportColor,
  });

  static List<SportsItems> sports = [
    SportsItems(
      sportName: "Football",
      sportIcon: const Icon(Icons.sports_soccer_rounded),
      sportColor: SportsColor.cFootball,
    ),
    SportsItems(
      sportName: "Cricket",
      sportIcon: const Icon(Icons.sports_cricket),
      sportColor: SportsColor.cCricket,
    ),
    SportsItems(
      sportName: "Basketball",
      sportIcon: const Icon(Icons.sports_basketball),
      sportColor: SportsColor.cBasketBall,
    ),
    SportsItems(
      sportName: "Volley ball",
      sportIcon: const Icon(Icons.sports_volleyball),
      sportColor: SportsColor.cVolleyBall,
    ),
    SportsItems(
      sportName: "Rugby",
      sportIcon: const Icon(
        Icons.sports_rugby,
        color: Colors.brown,
      ),
      sportColor: const Color.fromARGB(109, 121, 85, 72),
    ),
  ];
}

class SportNameCard {
  static sportItemsdata(BuildContext context) {
    final sports = SportsItems.sports;
    final size = MediaQuery.of(context).size;
    return List.generate(
      sports.length,
      (index) {
        final sportItems = sports[index];
        return Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Card(
            child: InkWell(
              onTap: () async {
                final navigator = Navigator.of(context);
                await context
                    .read<VenueBySportViewModel>()
                    .getVenueBySportDatas(sportItems.sportName.toLowerCase());
                log(sportItems.sportName.toLowerCase());
                navigator.push(
                  MaterialPageRoute(
                    builder: (context) =>
                        VenueBySportView(title: sportItems.sportName),
                  ),
                );
              },
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.30,
                child: Row(
                  children: [
                    Container(
                      width: size.height * 0.05,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        color: sportItems.sportColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                      ),
                      child: sportItems.sportIcon,
                    ),
                    SizedBox(
                      width: size.width * 0.15,
                      height: size.height * 0.05,
                      child: Center(
                        child: Text(
                          sportItems.sportName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
