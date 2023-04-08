import 'package:flutter/material.dart';
import '../../utils/global_colors.dart';

class SportsItems {
  final String sportName;
  final Widget sportIcon;
  final Color sportColor;
  final GestureTapCallback? onTap;

  SportsItems({
    required this.sportName,
    required this.sportIcon,
    required this.sportColor,
    required this.onTap,
  });

  static List<SportsItems> sports = [
    SportsItems(
      sportName: "Football",
      sportIcon: const Icon(Icons.sports_soccer_rounded),
      sportColor: SportsColor.cFootball,
      onTap: () {},
    ),
    SportsItems(
      sportName: "Cricket",
      sportIcon: const Icon(Icons.sports_cricket),
      sportColor: SportsColor.cCricket,
      onTap: () {},
    ),
    SportsItems(
      sportName: "Basketball",
      sportIcon: const Icon(Icons.sports_basketball),
      sportColor: SportsColor.cBasketBall,
      onTap: () {},
    ),
    SportsItems(
      sportName: "Vollyball",
      sportIcon: const Icon(Icons.sports_volleyball),
      sportColor:SportsColor.cVolleyBall,
      onTap: () {},
    ),
    SportsItems(
      sportName: "Badminton",
      sportIcon: const Icon(Icons.sports_soccer),
      sportColor: SportsColor.cBadminton,
      onTap: () {},
    ),
  ];
}

class SportNameCard {
  static sportItemsdata() {
    final sports = SportsItems.sports;
    return List.generate(sports.length, (index) {
      final sportItems = sports[index];
      return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Card(
          child: InkWell(
            onTap: sportItems.onTap,
            child: SizedBox(
              height: 40,
              width: 110,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
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
                    width: 60,
                    height: 40,
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
    });
  }
}
