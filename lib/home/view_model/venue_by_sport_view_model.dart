import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sporter_turf_booking/home/model/venue_by_sport_model.dart';

import '../../repo/api_services.dart';
import '../../repo/api_status.dart';
import '../../utils/constants.dart';

class VenueBySportViewModel with ChangeNotifier {
  // VenueBySportViewModel() {
  //   getVenueBySportDatas("");
  // }
  List<VenueBySportModel> _venueBySportList = [];
  Position? _currentPosition;
  bool _isVenueBySportLoading = false;

  List<VenueBySportModel> get venuDataList => _venueBySportList;
  Position? get currentPosition => _currentPosition;
  bool get isVenueBySportLoading => _isVenueBySportLoading;

  getVenueBySportDatas(String sport) async {
    setVenueBySportLoading(true);
    final response = await ApiServices.getMethod(
      url: Urls.kGETVENUEBYSPORT + sport,
      jsonDecod: venueBySportModelFromJson,
    );
    if (response is Success) {
      if (response.response != null) {
        await setVenueBySportData(response.response as List<VenueBySportModel>);
      }
      log("Success");
      // log(response.response.toString());
      setVenueBySportLoading(false);
    }
    if (response is Failure) {
      log("Error");
      setVenueBySportLoading(false);
    }
    setVenueBySportLoading(false);
  }

  setVenueBySportData(List<VenueBySportModel> venueDataList) async {
    _venueBySportList = venueDataList;
    notifyListeners();
  }

  setVenueBySportLoading(bool loading) {
    _isVenueBySportLoading = loading;
  }
}
