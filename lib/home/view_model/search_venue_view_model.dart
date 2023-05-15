import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporter_turf_booking/home/view_model/venue_list_view_model.dart';
import '../model/venue_data_model.dart';

class SearchVenueViewModel with ChangeNotifier {
  List<VenueDataModel> _resultVenueData = [];
  TextEditingController searchtext = TextEditingController();
  List<VenueDataModel> venueDataList = [];

  List<VenueDataModel> get resultVenueData => _resultVenueData;

  setSearchResult() {
    if (searchtext.text.isEmpty) {
      _resultVenueData = venueDataList;
    } else {
      final founded = venueDataList
          .where((element) => element.venueName!
              .toLowerCase()
              .contains(searchtext.text.toLowerCase()))
          .toList();

      setResultValue(founded);
    }
  }

  setResultValue(List<VenueDataModel> founded) {
    _resultVenueData = founded;
    log(_resultVenueData.length.toString());
    notifyListeners();
  }

  setDefault(BuildContext context) {
    venueDataList = context.watch<VenueListViewModel>().venuDataList;
    _resultVenueData = venueDataList;
  }

  clearField() {
    searchtext.clear();
  }
}
