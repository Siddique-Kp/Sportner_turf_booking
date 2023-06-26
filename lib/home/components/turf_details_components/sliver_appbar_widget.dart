import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';
import '../../model/venue_data_model.dart';
import '../../view_model/venue_details_view_model.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    required this.venueViewModel,
    required this.venueData,
  });

  final VenueDetailsViewModel venueViewModel;
  final VenueDataModel venueData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.white,
      expandedHeight: size.height * 0.30,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background:  Container(
                color: AppColors.lightGrey,
                child: Image.network(
                  venueData.image!,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text("Could not load image"),
                    );
                  },
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          width: double.infinity,
          height: 20,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(75, 158, 158, 158)),
            ),
          ),
        ),
      ),
    );
  }
}
