import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/components/error_data_widget.dart';
import 'package:sporter_turf_booking/home/components/sports_icon.dart';
import 'package:sporter_turf_booking/home/view_model/search_venue_view_model.dart';
import '../../utils/global_values.dart';
import '../components/venue_list_card_widget.dart';

class SearchVenueView extends StatelessWidget {
  const SearchVenueView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewModels = context.read<SearchVenueViewModel>();
    searchViewModels.setDefault(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        searchViewModels.clearField();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //       searchViewModels.clearField();
          //     },
          //     icon: const Icon(Icons.arrow_back)),
          // leadingWidth: 50,
          automaticallyImplyLeading: false,
          title: TextField(
            controller: searchViewModels.searchtext,
            onChanged: (value) {
              searchViewModels.setSearchResult();
            },
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: "Search Venue",
              prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  searchViewModels.clearField();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
        body: Consumer<SearchVenueViewModel>(
            builder: (context, searchViewModel, child) {
          return searchViewModel.resultVenueData.isEmpty ||
                  searchViewModel.venueDataList.isEmpty
              ? const NoDataWidget()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      AppSizes.kHeight20,
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: searchViewModel.resultVenueData.length,
                        separatorBuilder: (context, index) =>
                            AppSizes.kHeight20,
                        itemBuilder: (context, index) {
                          final venueData =
                              searchViewModel.resultVenueData[index];
                          return SizedBox(
                            width: double.infinity,
                            height: 80,
                            child: VenueListCardWidget(
                              venueName: venueData.venueName!,
                              imageUrl: venueData.image!,
                              sportFacilityLendth:
                                  venueData.sportFacility!.length,
                              venuePrice: venueData.actualPrice.toString(),
                              district: venueData.district!,
                              venueID: venueData.sId!,
                              sportIconWidget: ListView.builder(
                                itemCount: venueData.sportFacility!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Icon(
                                    Sports.spots(
                                      sport: venueData
                                          .sportFacility![index].sport!,
                                    ),
                                    size: 15,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
