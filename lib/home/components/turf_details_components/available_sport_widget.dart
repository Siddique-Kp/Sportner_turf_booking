import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/global_values.dart';

class AvailableSportsWidget extends StatelessWidget {
  const AvailableSportsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => MySize.kWidth10,
            itemBuilder: (BuildContext context, int index) {
              return _soprtContainer();
            },
          ),
        ],
      ),
    );
  }

  Widget _soprtContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(41, 158, 158, 158)),
      width: 70.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.sports_soccer),
          MySize.kHeight10,
          Text(
            "Football",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11,
              color: MyColors.black,
            ),
          )
        ],
      ),
    );
  }
}
