import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/utils/constants.dart';
import '../../repository/venue_list_repository.dart';

class VenueListViewModel with ChangeNotifier {
  VenueListViewModel() {
    getVenueListResponse();
  }
  ApiResponse<List<VenueDataModel>> _venueDataList = ApiResponse.loading();
  final List<VenueDataModel> _offeredVenues = [];

  ApiResponse<List<VenueDataModel>> get venuDataList => _venueDataList;
  List<VenueDataModel> get offeredVenues => _offeredVenues;

  final _myRepo = VenueListRepository();



  getVenueListResponse() async {
    setVenueListData(ApiResponse.loading());
    _myRepo.getVenueList(Urls.kGETALLVENUE).then((value) {
      log(value.toString());
      setVenueListData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      log("$error");
      setVenueListData(ApiResponse.error(error.toString()));
    });
  }

  setVenueListData(ApiResponse<List<VenueDataModel>> venueDataList) async {
    _venueDataList = venueDataList;
    getOfferedVenues();
    notifyListeners();
  }


  getOfferedVenues() {
    if (_venueDataList.data != null) {
      for (var offered in _venueDataList.data!) {
        final offerPercent = offered.discountPercentage;

        if (offerPercent! > 0) {
          _offeredVenues.add(offered);
        }
      }
    }
  }
}
