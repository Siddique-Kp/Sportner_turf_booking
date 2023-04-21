import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/get_location_view_model.dart';
import '../../utils/global_colors.dart';
import '../../utils/global_values.dart';

class AppBarLocation extends StatefulWidget {
  const AppBarLocation({
    super.key,
  });

  @override
  State<AppBarLocation> createState() => _AppBarLocationState();
}

class _AppBarLocationState extends State<AppBarLocation> {
  @override
  void initState() {
    context.read<GetLocationViewModel>().getCurrentPosition(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locatioViewModel = context.read<GetLocationViewModel>();
    return Consumer<GetLocationViewModel>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: AppColors.black),
            AppSizes.kWidth10,
            value.currentAddress == null
                ? const Text(
                    "No location picked",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locatioViewModel.currentAddress!.split(",").first,
                        style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${locatioViewModel.currentAddress?.split(",")[1]}, ${locatioViewModel.currentAddress?.split(",").last}",
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
          ],
        );
      },
    );
  }
}
