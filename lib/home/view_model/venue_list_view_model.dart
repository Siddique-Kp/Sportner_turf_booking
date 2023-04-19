import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/repo/api_status.dart';
import 'package:sporter_turf_booking/utils/constants.dart';

class VenueListViewModel with ChangeNotifier {
  List<VenueDataModel> _venueDataList = [];
  bool _isVenueListLoading = false;

  List<VenueDataModel> get venuDataList => _venueDataList;
  bool get isVenueListLoading => _isVenueListLoading;

  getVenueListDatas() async {
    setVenueListLoading(true);
    log("111111");
    final response = await ApiServices.getMethod(
      url: Urls.kGETALLVENUE,
      jsonDecod: venueDataModelListFromJson,
    );
    if (response is Success) {
      if (response.response != null) {
        log(response.response.toString());
        log("22222222");
        await setVenueListData(response.response as List<VenueDataModel>);
        log("33333333");
      }
      setVenueListLoading(false);
    }
    if (response is Failure) {
      log("Error");
      setVenueListLoading(false);
    }
    setVenueListLoading(false);
  }

  setVenueListData(List<VenueDataModel> venueDataList) async {
    _venueDataList = venueDataList;
    notifyListeners();
  }

  setVenueListLoading(bool loading) {
    _isVenueListLoading = loading;
    // notifyListeners();
  }
}
