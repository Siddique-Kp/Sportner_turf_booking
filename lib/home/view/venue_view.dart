import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/components/appbar_widget.dart';
import '../../utils/global_values.dart';
import '../components/venue_list_card_widget.dart';

class VenueScreenView extends StatelessWidget {
  const VenueScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: AppBarWidget(
          isVenueScreen: true,
          isHomeAppBar: true,
          filterPressed: () {},
          searchPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => AppSizes.kHeight20,
          itemBuilder: (context, index) {
            return const SizedBox(
              width: double.infinity,
              height: 80,
              child: VenueListCardWidget(),
            );
          },
        ),
      ),
    );
  }
}


