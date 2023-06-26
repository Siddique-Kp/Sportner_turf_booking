import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/data/response/api_response.dart';
import 'package:sporter_turf_booking/repository/venue_details_repository.dart';
import '../../utils/constants.dart';
import '../model/venue_data_model.dart';

class VenueDetailsViewModel with ChangeNotifier {
  ApiResponse<VenueDataModel> _venueDataModel = ApiResponse.loading();
  late VenueDataModel _venueData;
  int _dayIndex = -1;

  VenueDataModel get venueData => _venueData;
  ApiResponse<VenueDataModel> get venueDataModel => _venueDataModel;
  int get dayIndex => _dayIndex;

  final _myRepo = VenueDetailsRepository();

  getSingleVenue(String id) {
    setVenueData(ApiResponse.loading());
    _myRepo
        .getVenueDetails(Urls.kGETSINGLEVENUE + id)
        .then((value) => {setVenueData(ApiResponse.completed(value),),})
        .onError((error, stackTrace) =>
            {setVenueData(ApiResponse.error(error.toString()))});
  }

  setVenueData(ApiResponse<VenueDataModel> venueData) async {
    _venueDataModel = venueData;
    if (_venueDataModel.data != null) {
      _venueData = _venueDataModel.data!;
    }
    notifyListeners();
  }

  void getDayIndex(String dayName) {
    if (_venueData.slots!
        .any((venue) => venue.day!.toLowerCase() == dayName.toLowerCase())) {
      _dayIndex = _venueData.slots!.indexWhere(
          (venue) => venue.day!.toLowerCase() == dayName.toLowerCase());
      notifyListeners();
    }
  }
}
