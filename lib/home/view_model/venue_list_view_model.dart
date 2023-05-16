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
  final List<VenueDataModel> _offeredVenues = [];
  Position? _currentPosition;
  int? _errorCode;
  bool _isVenueListLoading = false;

  List<VenueDataModel> get venuDataList => _venueDataList;
  List<VenueDataModel> get offeredVenues => _offeredVenues;
  Position? get currentPosition => _currentPosition;
  int? get errorCode => _errorCode;
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
      setVenueError(response);
      setVenueListLoading(false);
    }
    setVenueListLoading(false);
  }

  setVenueListData(List<VenueDataModel> venueDataList) async {
    _venueDataList = venueDataList;
    getOfferedVenues();
    notifyListeners();
  }

  setVenueListLoading(bool loading) {
    _isVenueListLoading = loading;
  }

  setVenueError(Failure error) {
    _errorCode = error.code;
    notifyListeners();
  }

  getOfferedVenues() {
    for (var offered in _venueDataList) {
      final offerPercent = offered.discountPercentage;

      if (offerPercent! > 0) {
        _offeredVenues.add(offered);
      }
    }
  }
}
