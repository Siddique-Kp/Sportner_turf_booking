import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/repo/api_status.dart';
import 'package:sporter_turf_booking/utils/constants.dart';

class VenueListViewModel with ChangeNotifier {
  List<VenueDataModel?> _venueDataList = [];
  bool _isLoading = false;

  List<VenueDataModel?> get venuDataList => _venueDataList;
  bool get isLoading => _isLoading;

  getVenueDatas() async {
    setLoading(true);
    log("111111");

    final response = await ApiServices.getMethod(url: Urls.kGETALLVENUE,jsonDecod: venueDataModelListFromJson);
    if (response is Success) {
      
      if (response.response != null) {
        log(response.response.toString());
        log("22222222");
        await setVenueData(response.response as List<VenueDataModel?>);
        log("33333333");
      }
      notifyListeners();
    }
    if (response is Failure) {
      log("Error");
    }
  }

  setVenueData(List<VenueDataModel?> venueDataList) async {
    _venueDataList = venueDataList;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    // notifyListeners();
  }
}
