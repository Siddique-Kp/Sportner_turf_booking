import 'dart:developer';
import 'package:flutter/material.dart';
import '../../repo/api_services.dart';
import '../../repo/api_status.dart';
import '../../utils/constants.dart';
import '../model/venue_data_model.dart';

class VenueDetailsViewModel with ChangeNotifier {
  late VenueDataModel _venueData;
  bool _isLoading = false;

  VenueDataModel get venueData => _venueData;
  bool get isLoading => _isLoading;

  getSingleVenue(String id) async {
    setLoading(true);
    log("Called single");
    final response = await ApiServices.getMethod(
      url: Urls.kGETSINGLEVENUE + id,
      jsonDecod: venueDataModelFromJson,
    );

    if (response is Success) {
      log("response success");
      await setVenueData(response.response as VenueDataModel);
      log("Got data");
      setLoading(false);
    }

    if (response is Failure) {
      log("Single response error");
      setLoading(false);
    }
    setLoading(false);
  }

  setVenueData(VenueDataModel venueData)async {
    _venueData = venueData;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    // notifyListeners();
  }
}
