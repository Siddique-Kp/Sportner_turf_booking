import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sporter_turf_booking/home/model/venue_data_model.dart';
import 'package:sporter_turf_booking/repo/api_services.dart';
import 'package:sporter_turf_booking/repo/api_status.dart';
import 'package:sporter_turf_booking/utils/constants.dart';

class VenueListViewModel with ChangeNotifier {
  VenueListViewModel() {
    getVenueListDatas();
  }
  List<VenueDataModel> _venueDataList = [];
  Position? _currentPosition;
  bool _isVenueListLoading = false;

  List<VenueDataModel> get venuDataList => _venueDataList;
  Position? get currentPosition => _currentPosition;
  bool get isVenueListLoading => _isVenueListLoading;

  getVenueListDatas() async {
    setVenueListLoading(true);
    final response = await ApiServices.getMethod(
      url: Urls.kGETALLVENUE,
      jsonDecod: venueDataModelListFromJson,
    );
    if (response is Success) {
      if (response.response != null) {
        await setVenueListData(response.response as List<VenueDataModel>);
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
  }

}
